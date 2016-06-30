From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Jun 2016 12:15:31 +0200
Subject: [Buildroot] [PATCH v6] makedevs: add capability support
In-Reply-To: <a2777e4c-cbca-4304-84b0-d522343a8c48@EXDCVYARSGC004.eq1sgc.local>
 (Philippe Reynes's message of "Wed, 29 Jun 2016 17:19:44 +0200")
References: <a2777e4c-cbca-4304-84b0-d522343a8c48@EXDCVYARSGC004.eq1sgc.local>
Message-ID: <87h9cbf0e4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Philippe" == Philippe Reynes <philippe.reynes@sagemcom.com> writes:

 > Add the support of capability to makedevs as extended attribute.
 > Now, it's possible to add a  line "|xattr <capability>" after a
 > file description to also add a capability to this file. It's
 > possible to add severals capabilities with severals lines.

 > Signed-off-by: Philippe Reynes <philippe.reynes@sagemcom.com>
 > ---
 > Changelog:
 > v6:
 > - really remove footer in the mail sent to the ml

It's still there ;)

> v5:
 > - remove footer in the mail sent to the ml
 > v4:
 > - use use bb_perror_msg_and_die in makedevs code
 > - fix typo in makedevs documentation
 > v3:
 > - update makedevs code to manage more error case
 > - use exit instead of return in makedevs
 > v2:
 > - add an option to enable (or not) xattr support in makedevs
 > - update makedevs code to handle |xattr on the first line
 > - add documentation about xattr support in makedevs

 >  docs/manual/makedev-syntax.txt |   29 ++++++++++++++++
 >  package/makedevs/makedevs.c    |   71 ++++++++++++++++++++++++++++++++++++++--
 >  package/makedevs/makedevs.mk   |   10 ++++--
 >  system/Config.in               |    5 +++
 >  4 files changed, 111 insertions(+), 4 deletions(-)

 > diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
 > index e4dffc9..9d73b8b 100644
 > --- a/docs/manual/makedev-syntax.txt
 > +++ b/docs/manual/makedev-syntax.txt
 > @@ -71,3 +71,32 @@ and then for device files corresponding to the partitions of
 >  /dev/hda b 640 root root 3 1 1 1 15
 >  ----

 > +The tool makedevs supports extended attributes for a file.

I've extended this line to explain that this is only available if
BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES is enabled.

 > @@ -454,15 +501,29 @@ int main(int argc, char **argv)
 >  		unsigned int count = 0;
 >  		unsigned int increment = 0;
 >  		unsigned int start = 0;
 > +		char xattr[255];
 >  		char name[4096];
 >  		char user[41];
 >  		char group[41];
 > -		char *full_name;
 >  		uid_t uid;
 >  		gid_t gid;
 
 >  		linenum++;
 
 > +		if (1 == sscanf(line, "|xattr %254s", xattr))
 > +		{

The rest of the file uses '{' on the same line as if, so I've changed
this.

> +#ifdef EXTENDED_ATTRIBUTES
 > +			if (!full_name)
 > +				bb_error_msg_and_die("line %d should be after a file\n", linenum);
 > +
 > +			if (bb_set_xattr(full_name, xattr) < 0)
 > +				bb_error_msg_and_die("can't set cap %s on file %s\n", xattr, full_name);
 > +#else
 > +			bb_error_msg_and_die("line %d not supported: '%s'\n", linenum, line);

That is not a very helpful error message. I have extended it to explain
to the user what to do:

+                       bb_error_msg_and_die("line %d not supported: '%s'\nDid you forget to enable "
+                                            "BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES?\n",
+                                            linenum, line);


I also noticed that you didn't update bb_show_usage to document the
xattr format (protected by #ifdef EXTENDED_ATTRIBUTES). Care to send a
followup patch doing that?


> +#endif /* EXTENDED_ATTRIBUTES */
 > +			continue;
 > +		}
 > +
 >  		if ((2 > sscanf(line, "%4095s %c %o %40s %40s %u %u %u %u %u", name,
 >  						&type, &mode, user, group, &major,
 >  						&minor, &start, &increment, &count)) ||
 > @@ -487,6 +548,13 @@ int main(int argc, char **argv)
 >  		} else {
 >  			uid = getuid();
 >  		}
 > +
 > +		/*
 > +		 * free previous full name
 > +		 * we don't de-allocate full_name at the end of the parsing,
 > +		 * because we may need it if the next line is an xattr.
 > +		 */
 > +		free(full_name);
 >  		full_name = concat_path_file(rootdir, name);
 
 >  		if (type == 'd') {
 > @@ -585,7 +653,6 @@ int main(int argc, char **argv)
 >  		}
 >  loop:
 >  		free(line);
 > -		free(full_name);
 >  	}
 >  	fclose(table);
 
 > diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
 > index fa8e753..b2efda9 100644
 > --- a/package/makedevs/makedevs.mk
 > +++ b/package/makedevs/makedevs.mk
 > @@ -11,6 +11,12 @@ HOST_MAKEDEVS_SOURCE =
 >  MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)
 >  MAKEDEVS_LICENSE = GPLv2
 
 > +ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
 > +HOST_MAKEDEVS_DEPENDENCIES += host-libcap
 > +HOST_MAKEDEVS_CFLAGS = -DEXTENDED_ATTRIBUTES
 > +HOST_MAKEDEVS_LDFLAGS = -lcap
 > +endif

Elsewhere we assign HOST_<foo>_CFLAGS to $(HOST_CFLAGS) (and same for
LDFLAGS) and then use += for conditional stuff, so I've changed that.


> +
 >  define MAKEDEVS_BUILD_CMDS
 >  	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
 >  		package/makedevs/makedevs.c -o $(@D)/makedevs
 > @@ -21,8 +27,8 @@ define MAKEDEVS_INSTALL_TARGET_CMDS
 >  endef
 
 >  define HOST_MAKEDEVS_BUILD_CMDS
 > -	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
 > -		package/makedevs/makedevs.c -o $(@D)/makedevs
 > +	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) $(HOST_MAKEDEVS_CFLAGS) \
 > +		package/makedevs/makedevs.c -o $(@D)/makedevs $(HOST_MAKEDEVS_LDFLAGS)

And dropped HOST_CFLAGS / HOST_LDFLAGS here.

>  endef
 
 >  define HOST_MAKEDEVS_INSTALL_CMDS
 > diff --git a/system/Config.in b/system/Config.in
 > index 3018b0a..caa8d4b 100644
 > --- a/system/Config.in
 > +++ b/system/Config.in
 > @@ -162,6 +162,11 @@ config BR2_ROOTFS_STATIC_DEVICE_TABLE
 >  	  See package/makedevs/README for details on the usage and
 >  	  syntax of these files.
 
 > +config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
 > +	bool "device table supports extended attributes"
 > +	help
 > +	  Add the support of extended attributes to device table
 > +

I've reworded this slightly.

While reviewing this I wondered about a few things:

- Do all our file systems support extended attributes? Should we warn
  the user if they are used together with fs'es not supporting it?

- Are all our filesystem tools (for fs'es supporting it) built with
  xattr support when this option is enabled? Are they called with the
  correct arguments to handle xattrs?

- How should this be handled for <foo>_PERMISSIONS in packages? Should
  those packages select
  BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES? Alternatively we
  should change makedevs.c to only warn about xattr lines when this is
  disabled instead of making it a hard error. Things become a bit akward
  if you first do a build without this option and then enable a package
  selecting it and rerun make. Host-makedevs will not be rebuilt and it
  will fail.

Anyway, these are all issues we can work out later. I've committed your
patch with the above fixes, thanks.

-- 
Bye, Peter Korsgaard
