From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 22 Jan 2019 11:11:12 -0500
Subject: [Buildroot] Problem with pkg-config while running autogen.sh
 for gst-shark
In-Reply-To: <CA+9OK-orxCYvqauH4bTdWEwJjZkCQS35EwOW_rv=Ncz6wgHqBQ@mail.gmail.com>
References: <CA+9OK-orxCYvqauH4bTdWEwJjZkCQS35EwOW_rv=Ncz6wgHqBQ@mail.gmail.com>
Message-ID: <CAFSsvmrL6jhgG5yWD6qKzpwxcggQpbK_C-3pk5_WCdS7asrHSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jo?o;


On Tue, Jan 22, 2019 at 9:07 AM Jo?o Victor Oliveira <jv.oliveirag@gmail.com>
wrote:

> Hi,
> I've installed buildroot very recently and I'm working with "gst-shark",
> which recipe is shown below:
>
> ################################################################################
> #
> # gst-shark
> #
>
> ################################################################################
>
> GST_SHARK_VERSION = 0.5.5
> GST_SHARK_SOURCE = v$(GST_SHARK_VERSION).tar.gz
> GST_SHARK_SITE = https://github.com/RidgeRun/gst-shark.git
> GST_SHARK_DEPENDENCIES = host-pkgconf libglib2
>
GST Shark will at a minimum depend on gstreamer1.

#GST-SHARK_INSTALL_STAGING = YES
> #GST-SHARK_INSTALL_TARGET = YES
> #GST_SHARK_AUTORECONF = YES
> Is there a reason why AUTORECONF = YES doesn't work?
>


> define GST_SHARK_CONFIGURE_CMDS
>         echo "Configurando ae"
>         (cd $(@D) && ./autogen.sh --prefix=/usr
> --libdir=$(STAGING_DIR)/usr/lib --disable-gtk-doc)
> endef
>
> This shouldn't have to be done if the package is set to an
autotools-package


> $(eval $(generic-package))
>

You could set this to an autotools package as well. This will pass a lot of
configuration
options to ./configure that should set you up properly.


> And I think i've got an issue with the pkg-config when I run "autogen.sh"
> Here's the log:
> [...]
> checking for gcc option to accept ISO C89... (cached) none needed
> checking whether gcc understands -c and -o together... (cached) yes
> checking dependency style of gcc... (cached) gcc3
> checking for gcc option to accept ISO C99... none needed
> checking for gcc option to accept ISO Standard C... (cached) none needed
> checking for valgrind... no
> checking for gobject-introspection... no
> checking for gtkdoc-check... no
> checking for gtkdoc-rebase... no
> checking for gtkdoc-mkpdf... no
> configure: error: You need to have gtk-doc >= 1.12 installed to build
> GstShark
>   configure failed
>
If setting  the package to autotools generates the same error, then you
will need to patch out the check
for gtk-doc.

Any ideia of what I need to do to solve this?
>

Thanks!
Adam

>
>
> <https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail> Livre
> de v?rus. www.avast.com
> <https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>.
> <#m_-2361808580268701653_DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190122/a7b4599c/attachment.html>
