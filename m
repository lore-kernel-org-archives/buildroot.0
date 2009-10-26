From: Hugues <hugues@hiegel.fr>
Date: Mon, 26 Oct 2009 22:15:37 +0100
Subject: [Buildroot] [PATCH] netkitftp: added package with
	Makefile.autotools.in support
In-Reply-To: <874opmf2pe.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Mon\, 26 Oct 2009 19\:08\:13 +0100")
References: <1256573832-11116-1-git-send-email-hugues@hiegel.fr>
	<1256573832-11116-2-git-send-email-hugues@hiegel.fr>
	<874opmf2pe.fsf@macbook.be.48ers.dk>
Message-ID: <8763a1dfgm.fsf@paranoid.sweethome>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

Thanks for the comments,
I've got some questions ;

Ce cher Peter Korsgaard <jacmet@uclibc.org> a dit :

>>>>>> "Hugues" == Hugues Hiegel <hugues@hiegel.fr> writes:
>
> Hi,
>
> Thanks for the patch - A few comments:
>
>  Hugues> diff --git a/package/netkitftp/Config.in b/package/netkitftp/Config.in
>  Hugues> new file mode 100644
>  Hugues> index 0000000..9b37d6e
>  Hugues> --- /dev/null
>  Hugues> +++ b/package/netkitftp/Config.in
>  Hugues> @@ -0,0 +1,9 @@
>  Hugues> +config BR2_PACKAGE_NETKITFTP
>  Hugues> +	bool "netkitftp"
>  Hugues> +	default n
>
> 'n' is default, so no need to explictly list that.

Ok.

>  Hugues> +	help
>  Hugues> +	  ftp client.
>  Hugues> +	  ftp client version 0.17-16 with debian patch.
>  Hugues> +	            ftp://ftp.debian.org/debian/pool/main/netkit-ftp/
>
> That's not a good help text. We generally don't list version numbers in
> the help text as they tend to get out of sync with the .mk files fast.

Yup, I  just translated the  french text that  was there just  before, I
didn't thought about this way :)

I'll correct this.

>  Hugues> +
>  Hugues> +	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
>  Hugues> diff --git a/package/netkitftp/netkitftp-configure-noexit.patch b/package/netkitftp/netkitftp-configure-noexit.patch
>  Hugues> new file mode 100644
>  Hugues> index 0000000..f588a46
>  Hugues> --- /dev/null
>  Hugues> +++ b/package/netkitftp/netkitftp-configure-noexit.patch
>  Hugues> @@ -0,0 +1,13 @@
>  Hugues> +diff --git a/configure b/configure
>  Hugues> +index 0440527..54a5278 100755
>  Hugues> +--- a/configure
>  Hugues> ++++ b/configure
>  Hugues> +@@ -39,7 +39,7 @@ EOF
>  Hugues> + 	--manmode=*) MANMODE=`echo $1 | sed 's/^[^=]*=//'` ;;
>  Hugues> + 	--with-c-compiler=*) CC=`echo $1 | sed 's/^[^=]*=//'` ;;
>  Hugues> + 	--without-readline|--disable-readline) WITHOUT_READLINE=1;;
>  Hugues> +-	*) echo "Unrecognized option: $1"; exit 1;;
>  Hugues> ++	*) echo "Unrecognized option: $1";;
>
> Please document patches. Why is this needed, and is this something that
> should get submitted upstream?

Good remark. I'll correct this asap.

>  Hugues> diff --git a/package/netkitftp/netkitftp-configure.patch b/package/netkitftp/netkitftp-configure.patch
>
> That one as well.

Well... This one was already packaged with the package I've got, I don't
have any idea why it is needed. I'll check this and then verify if it is
really needed (hope it is not :-) )

>  Hugues> +++ b/package/netkitftp/netkitftp.mk
>  Hugues> @@ -0,0 +1,23 @@
>  Hugues> +#############################################################
>  Hugues> +#
>  Hugues> +# netkitftp
>  Hugues> +#
>  Hugues> +#############################################################
>  Hugues> +NETKITFTP_VERSION:=0.17
>  Hugues> +NETKITFTP_SOURCE:=netkit-ftp_$(NETKITFTP_VERSION).orig.tar.gz
>  Hugues> +NETKITFTP_PATCH:=netkit-ftp_0.17-16.diff.gz
>  Hugues> +NETKITFTP_SITE:=ftp://ftp.debian.org/debian/pool/main/n/netkit-ftp/
>
> Is that a stable URL? Would something on snapshot.debian.net be better?
> We have BR2_DEBIAN_MIRROR, which should be used.

Oh, that's right !
I'll correct this.

>  Hugues> +
>  Hugues> +NETKITFTP_CONF_OPT = --installroot=$(TARGET_DIR) \
>
> Something regarding TARGET_DIR at configure time? Doesn't that leak
> paths on the build host to the installed binaries?

Well, I didn't investigated further,  maybe is this not needed. I'll try
without and throw then this out, if not.
Or comment it, if needed :o)

>  Hugues> +					--without-readline
>  Hugues> +NETKITFTP_MAKE_ENV = SUB=ftp
>
> A comment to why would be good.

Ok.

>  Hugues> +NETKITFTP_INSTALL_TARGET_OPT = INSTALL_PREFIX=$(TARGET_DIR) install
>  Hugues> +
>  Hugues> +$(eval $(call AUTOTARGETS,package,netkitftp))
>  Hugues> +
>  Hugues> +$(NETKITFTP_HOOK_POST_BUILD):
>  Hugues> +	[ ! -d $(TARGET_DIR)/usr/man/man1 ] && install -d $(TARGET_DIR)/usr/man/man1 || true
>  Hugues> +	[ ! -d $(TARGET_DIR)/usr/man/man5 ] && install -d $(TARGET_DIR)/usr/man/man5 ||?true
>
> You have _true at the man5 line.

How, sh*t. These  funky french keyboards on early testing Debian put
this awkward  unbreakable space  while pressing AltGt+Space...  I didn't
saw this  earlier. (Seems to have  been corrected since, at  least on my
personal desktop at  home, which is more fresh than the  one I've got at
work, it is.) 

> Simply doing mkdir -p
> $(TARGET_DIR)/usr/man/man1 $(TARGET_DIR)/usr/man/man5 would be simpler
> to read.

Great remark.
Anyway, I don't know why I did this way.... O_o
;)

> Also don't forget to touch $@ so the target isn't always considered out
> of date.

Ok. I didn't thought it was  necessary at this state, but if you suggest
it.. ;-)

> A comment to why the above is needed in the first place would also be
> good.

Ok

>  Hugues> +
>  Hugues> +$(NETKITFTP_HOOK_POST_INSTALL):
>  Hugues> +	rm -vfr $(TARGET_DIR)/usr/man
>
> Why verbose?

Mhmm.. because with the "fr", it makes "vfr", which is a motorbike.. ;o)
I'll throw it ;)

> That uninstall would also remove all other man pages, so
> don't do that.

Mhmm... I'm not sure I understood this.. Why do you talk about uninstall ?
The  netkitftp's 'install'  rule  does installs  the  manpages with  the
binary, without ability  to call just the install  of the binary without
the manpages.
So I did like I see in other packages : just delete the 
$(TARGET_DIR)/usr/man folder... Is this a bad idea ?
What do you suggest at this stage ? 
Doing nothing, this will be cleaned later ?


With best regards,
-- 
Hugues Hiegel                                [http://www.hiegel.fr/~hugues/]
