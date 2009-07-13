From: laurent laffont <laurent.laffont@gmail.com>
Date: Mon, 13 Jul 2009 10:27:00 +0200
Subject: [Buildroot] [PATCH] add ruby serialport extension
In-Reply-To: <4a339d7c0907130123u64b93c08h3c3f3a850188b1ec@mail.gmail.com>
References: <1247141343-8641-1-git-send-email-laurent.laffont@gmail.com>
	<87skh182ht.fsf@macbook.be.48ers.dk>
	<4a339d7c0907130123u64b93c08h3c3f3a850188b1ec@mail.gmail.com>
Message-ID: <4a339d7c0907130127k2771ad59sd6702c71a6c1a6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 13, 2009 at 9:29 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "laurent" == laurent laffont <laurent.laffont@gmail.com> writes:
>
> Hi,
>
>  laurent> From: laurent laffont <laurent.laffont@gmail.com>
>  laurent> Handle ruby serialport extension cross compilation.
>  laurent> http://rubyforge.org/projects/ruby-serialport/
>
>  laurent> Signed-off-by: laurent laffont <laurent.laffont@gmail.com>
>
>  laurent> +++ b/package/ruby-serialport/ruby-serialport-fix-1.9.patch
>  laurent> @@ -0,0 +1,52 @@
>  laurent> +--- a/ext/impl/posix_serialport.c    2008-12-23
> 20:35:07.000000000 +0000
>  laurent> ++++ b/ext/impl/posix_serialport.c    2009-05-21
> 16:37:13.000000000 +0100
>  laurent> +@@ -38,16 +38,16 @@
>  laurent> + static int get_fd_helper(obj)
>  laurent> +    VALUE obj;
>  laurent> + {
>  laurent> +-   OpenFile *fptr;
>  laurent> ++   rb_io_t *fptr;
>
>
> What is this for? It doesn't seem buildroot specific?



This patch is needed to compile ruby-serialport with ruby 1.9.1 See
http://rubyforge.org/tracker/index.php?func=detail&aid=23788&group_id=61&atid=320


>
>
>
>  laurent> diff --git a/package/ruby-serialport/ruby-serialport.mkb/package/ruby-serialport/
> ruby-serialport.mk
>  laurent> new file mode 100644
>  laurent> index 0000000..797646c
>  laurent> --- /dev/null
>  laurent> +++ b/package/ruby-serialport/ruby-serialport.mk
>  laurent> @@ -0,0 +1,53 @@
>  laurent> +#############################################################
>  laurent> +#
>  laurent> +# ruby-serialport
>  laurent> +#
>  laurent> +#############################################################
>  laurent> +RUBY_SERIALPORT_VERSION = 0.7.0
>  laurent> +RUBY_SERIALPORT_SOURCE =
> ruby-serialport-$(RUBY_SERIALPORT_VERSION).tar.gz
>  laurent> +RUBY_SERIALPORT_SITE =
> http://rubyforge.org/frs/download.php/49992
>  laurent>
> +RUBY_SERIALPORT_DIR:=$(BUILD_DIR)/ruby-serialport-$(RUBY_SERIALPORT_VERSION)
>  laurent> +RUBY_SERIALPORT_CAT:=$(ZCAT)
>  laurent> +
>  laurent> +$(DL_DIR)/$(RUBY_SERIALPORT_SOURCE):
>  laurent> +      $(call
> DOWNLOAD,$(RUBY_SERIALPORT_SITE,$(RUBY_SERIALPORT_SOURCE))
>  laurent> +
>  laurent> +ruby-serialport-source: $(DL_DIR)/$(RUBY_SERIALPORT_SOURCE)
>  laurent> +
>  laurent> +$(RUBY_SERIALPORT_DIR)/.unpacked:
> $(DL_DIR)/$(RUBY_SERIALPORT_SOURCE)
>  laurent> +     $(RUBY_SERIALPORT_CAT) $(DL_DIR)/$(RUBY_SERIALPORT_SOURCE)
> | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>  laurent> +     toolchain/patch-kernel.sh $(RUBY_SERIALPORT_DIR)
> package/ruby-serialport/ ruby-serialport\*.patch
>  laurent> +     touch $@
>  laurent> +
>  laurent> +$(RUBY_SERIALPORT_DIR)/.configured:
> $(RUBY_SERIALPORT_DIR)/.unpacked
>  laurent> +     (cd $(RUBY_SERIALPORT_DIR)/ext; rm Makefile; \
>  laurent> +
> RUBYLIB=$(RUBY_DIR):$(RUBY_DIR)/lib:$(RUBY_DIR)/.ext ruby-1.9 -e "require
> 'mkmf'; create_makefile('serialport')";)
>
>
> This expects the host to have ruby 1.9 installed. Either we need to
> add a check with a sensible error message or you need to compile ruby
> for the host in $(HOST_DIR) and use that instead. See libglib2.mk for
> an example.


OK, I will take look.


>
>
>
>  laurent> +$(RUBY_SERIALPORT_DIR)/.installed:
> $(RUBY_SERIALPORT_DIR)/ext/serialport.so
>  laurent> +     (cd $(RUBY_SERIALPORT_DIR)/ext; \
>  laurent> +             $(MAKE) DESTDIR=$(TARGET_DIR)
> extout=$(RUBY_DIR)/.ext install)
>
>
> Doesn't this need to be stripped?


I will try.



>
>  laurent> +     touch $@
>  laurent> +
>  laurent> +ruby-serialport: $(RUBY_SERIALPORT_DIR)/.installed
>  laurent> +
>  laurent> +ruby-serialport-clean:
>  laurent> +     (cd $(RUBY_SERIALPORT_DIR)/ext; \
>  laurent> +             $(MAKE) DESTDIR=$(TARGET_DIR)
> extout=$(RUBY_DIR)/.ext clean)
>
>
> This will fail if the -source target hasn't executed yet (E.G. running
> make clean; make clean) - You can fix it by prefixing the line with
> '-' to tell make to ignore errors.


OK. Thanks for your comments.

Regards,

Laurent Laffont
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090713/489f8bd6/attachment-0001.htm>
