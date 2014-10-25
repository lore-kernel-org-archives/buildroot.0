From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 25 Oct 2014 08:36:40 +0200
Subject: [Buildroot] [PATCH 1/1] Add proxy download support
In-Reply-To: <20141024232355.GC14818@free.fr>
References: <1413903203-33909-1-git-send-email-kaszak@gmail.com>
 <20141024232355.GC14818@free.fr>
Message-ID: <CABbD_XAOnFHNmcB87Br94_BGX1EAmcd2O_vxPt4Cnyw97gDObw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, I understand.

Best regards,
Karoly
On 25 Oct 2014 01:24, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Karoly, All,
>
> On 2014-10-21 16:53 +0200, Karoly Kasza spake thusly:
> > This patch adds support for downloading sources over a http proxy.
> > Supports wget with http, https & ftp targets, bzr, hg, svn.
> > Git does work with forcing https instead of git protocol.
> > Cvs is not supported, but Buildroot does not currently have any
> > packages relying on cvs repos (plus this would fall back to the
> > Buildroot mirror over http).
> >
> > Signed-off-by: Karoly Kasza <kaszak@gmail.com>
>
> After speaking with Peter, and given the feedback from both Arnout and
> I, we believe this belongs to the user's settings, and has no place in
> Buildroot.
>
> So, I've marked this patch as Rejected in patchwork.
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  Config.in                |   25 +++++++++++++++++++++++++
> >  Makefile                 |    9 +++++++++
> >  support/download/wrapper |   26 ++++++++++++++++++++++++++
> >  3 files changed, 60 insertions(+)
> >
> > diff --git a/Config.in b/Config.in
> > index 9cefcbc..2e2b493 100644
> > --- a/Config.in
> > +++ b/Config.in
> > @@ -253,6 +253,31 @@ config BR2_CPAN_MIRROR
> >
> >  endmenu
> >
> > +config BR2_PROXY
> > +     bool "Use http proxy"
> > +     help
> > +       Use a http proxy when downloading sources with various protocols.
> > +
> > +if BR2_PROXY
> > +
> > +config BR2_PROXY_URL
> > +     string "Http proxy URL"
> > +     help
> > +       Http proxy URL in the form of <IP or FQDN>:<port>.
> > +
> > +config BR2_PROXY_USER
> > +     string "Http proxy username"
> > +     help
> > +       Http proxy username (if needed).
> > +
> > +config BR2_PROXY_PASS
> > +     string "Http proxy password"
> > +     help
> > +       Http proxy password (if needed).
> > +       PLEASE NOTE! This password will be saved in the .config file!
> > +
> > +endif
> > +
> >  config BR2_JLEVEL
> >       int "Number of jobs to run simultaneously (0 for auto)"
> >       default "0"
> > diff --git a/Makefile b/Makefile
> > index 907a0fc..5dd40e8 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -338,6 +338,15 @@ TARGET_SKELETON = $(TOPDIR)/system/skeleton
> >  # should not be used as the root filesystem.
> >  TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
> >
> > +ifeq ($(BR2_PROXY),y)
> > +BR_PROXY_URL = $(call qstrip,$(BR2_PROXY_URL))
> > +export BR_PROXY_URL
> > +BR_PROXY_USER = $(call qstrip,$(BR2_PROXY_USER))
> > +export BR_PROXY_USER
> > +BR_PROXY_PASS = $(call qstrip,$(BR2_PROXY_PASS))
> > +export BR_PROXY_PASS
> > +endif
> > +
> >  ifeq ($(BR2_CCACHE),y)
> >  CCACHE := $(HOST_DIR)/usr/bin/ccache
> >  BR_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
> > diff --git a/support/download/wrapper b/support/download/wrapper
> > index 8ae2797..b224474 100755
> > --- a/support/download/wrapper
> > +++ b/support/download/wrapper
> > @@ -44,6 +44,32 @@ tmpf="${tmpd}/output"
> >  # Doing the 'cd' here rather than in all helpers is easier.
> >  cd "${tmpd}"
> >
> > +# Set the proxy environment variables.
> > +# cvs doesn't support proxies OOB, but there is currently no cvs
> > +# based package in Buildroot. Also, in that case after the download
> > +# fails, the wget method would be used from sources.buildroot.net.
> > +if [ -n "${BR_PROXY_URL}" ]; then
> > +# SVN does not support http_proxy environment variables, so we use
> > +# it's commandline arguments
> > +proxy_host=`echo $BR_PROXY_URL | cut -d":" -f1`
> > +proxy_port=`echo $BR_PROXY_URL | cut -d":" -f2`
> > +SVN="${SVN} --config-option
> servers:global:http-proxy-host=${proxy_host} \
> > +--config-option servers:global:http-proxy-port=${proxy_port}"
> > +if [ -n "${BR_PROXY_USER}" ] && [ -n "${BR_PROXY_PASS}" ]; then
> > +SVN="${SVN} --config-option
> servers:global:http-proxy-username=${BR_PROXY_USER} \
> > +--config-option servers:global:http-proxy-password=${BR_PROXY_PASS}"
> > +proxy="http://${BR_PROXY_USER}:${BR_PROXY_PASS}@${BR_PROXY_URL}"
> > +else
> > +proxy="http://${BR_PROXY_URL}"
> > +fi
> > +export http_proxy=${proxy}
> > +export https_proxy=${proxy}
> > +export ftp_proxy=${proxy}
> > +# While git does support http_proxy environment variables, we need to
> use
> > +# the config option below to force proxying over https instead of git
> > +GIT="${GIT} -c url.https://.insteadOf=git://"
> > +fi
> > +
> >  # If the helper fails, we can just remove the temporary directory to
> >  # remove all the cruft it may have left behind. Then we just exit in
> >  # error too.
> > --
> > 1.7.10.4
> >
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141025/5018238a/attachment.html>
