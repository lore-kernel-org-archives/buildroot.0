From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Apr 2015 18:37:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix
 /usr/lib/tmpfiles.d/etc.conf
In-Reply-To: <1429272537-20122-1-git-send-email-ivo.slanina@gmail.com>
References: <1429272537-20122-1-git-send-email-ivo.slanina@gmail.com>
Message-ID: <553136CD.2000607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ivo,

On 17/04/15 14:08, Ivo Slanina wrote:
> Current systemd version (219) has bug in tmpfiles.d/etc.conf.m4 file.
> Bug causes adding line
> 
>     C /etc/pam.d - - - -
> 
> into /usr/lib/tmpfiles.d/etc.conf, regardless of wheter systemd is configured
> with --disable-pam option or not. Since systemd is always compiled with this
> option, that line causes fauilure in systemd systemd-tmpfiles-setup.service
> unit during boot.
> 
> Failure is caused becase systemd is trying to copy directory /usr/share/factory/etc/pam.d/
> into /etc, which doesn't exist.
> 
> This patch adds 0004-only-copy-etc-pam.d-if-pam-is-present.patch file into
> systemd package directory to fix downloaded source tree.
> 
> This issue is also solved in systemd source, but isn't released yet. After
> release and appropriate package upgrade, this patch will be no more relevant
> and should be removed.
> (http://lists.freedesktop.org/archives/systemd-devel/2015-March/028937.html)
> 
> Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
> ---
>  .../0004-only-copy-etc-pam.d-if-pam-is-present.patch   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 package/systemd/0004-only-copy-etc-pam.d-if-pam-is-present.patch
> 
> diff --git a/package/systemd/0004-only-copy-etc-pam.d-if-pam-is-present.patch b/package/systemd/0004-only-copy-etc-pam.d-if-pam-is-present.patch
> new file mode 100644
> index 0000000..983b931
> --- /dev/null
> +++ b/package/systemd/0004-only-copy-etc-pam.d-if-pam-is-present.patch
> @@ -0,0 +1,18 @@
> +only copy /etc/pam.d if PAM is present
> +
> +This patch is taken from systemd source.
> +See http://lists.freedesktop.org/archives/systemd-devel/2015-March/028937.html
> +
> +Current systemd release doesn? contain patched tmpfiles.d/etc.conf.m4
                           doesn't

> +file. After releasing new systemd version and bumbing to it, this patch
                                                 bumping

> +should be no longer needed.

 Patches should also have a Signed-off-by line.

 Also if it is an upstream patch, please include the upstream commit sha1, not
just the ML archive link.


 Regards,
 Arnout

> +
> +--- systemd-219.orig/tmpfiles.d/etc.conf.m4	2015-04-17 11:37:41.451001621 +0200
> ++++ systemd-219/tmpfiles.d/etc.conf.m4	2015-04-17 11:38:43.738749756 +0200
> +@@ -14,4 +14,6 @@
> + L /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf
> + )m4_dnl
> + C /etc/nsswitch.conf - - - -
> ++m4_ifdef(`HAVE_PAM',
> + C /etc/pam.d - - - -
> ++)m4_dnl
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
