From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Oct 2014 13:05:08 +0200
Subject: [Buildroot] [PATCH v3] rpi-userland: bump revision for musl
	compile fixes
In-Reply-To: <1413561468-27240-1-git-send-email-maarten@treewalker.org>
References: <1410541269-32529-1-git-send-email-maarten@treewalker.org>
 <1413561468-27240-1-git-send-email-maarten@treewalker.org>
Message-ID: <20141018110508.GC3858@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marten, All,

On 2014-10-17 17:57 +0200, Maarten ter Huurne spake thusly:
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
> The second version of this patch was missing the "v2" label; this is
> the third version.
> 
> The changes from v2, plus an additional change I made later were merged
> upstream. This patch bumps the git revision to the merge commit.
> 
> rpi-userland-002-remove-faulty-assert.patch had to be updated to match
> other changes in the code that are pulled in by the version bump.
> I checked that the updated patch compiles fine, but I have no idea
> whether it is still needed to fix or work around a runtime problem.

So, I have tested this bump: weston on the rpi no longer works, with or
without the asser patch.

So, I NAK this bump for now.

I'll see to bisect rpi-userland to see where it breaks.

Regards,
Yann E. MORIN.

>  .../rpi-userland-002-remove-faulty-assert.patch    | 25 ++++++++++++----------
>  package/rpi-userland/rpi-userland.mk               |  2 +-
>  2 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/package/rpi-userland/rpi-userland-002-remove-faulty-assert.patch b/package/rpi-userland/rpi-userland-002-remove-faulty-assert.patch
> index c23c43a..450f287 100644
> --- a/package/rpi-userland/rpi-userland-002-remove-faulty-assert.patch
> +++ b/package/rpi-userland/rpi-userland-002-remove-faulty-assert.patch
> @@ -3,19 +3,22 @@ interface: remove faulty assert() to make weston happy at runtime
>  This was removed after a discussion on IRC with the weston guys
>  ('daniels' on irc.freenode.net/#wayland).
>  
> +Rebased on 4333d6d by Maarten ter Huurne <maarten@treewalker.org>.
> +
>  Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  ---
>  Upstream status: no, will be pushed by weston guys later.
>  If not, I'll do it.
>  
> -diff -durN rpi-userland-77d32cd.orig/interface/vmcs_host/vc_vchi_dispmanx.c rpi-userland-77d32cd/interface/vmcs_host/vc_vchi_dispmanx.c
> ---- rpi-userland-77d32cd.orig/interface/vmcs_host/vc_vchi_dispmanx.c	2013-10-04 17:43:44.000000000 +0200
> -+++ rpi-userland-77d32cd/interface/vmcs_host/vc_vchi_dispmanx.c	2013-10-08 22:28:51.611433539 +0200
> -@@ -1187,7 +1187,6 @@
> -          continue;
> -    
> -       if(dispmanx_client.update_callback ) {
> --         vcos_assert( dispmanx_client.pending_update_handle == (DISPMANX_UPDATE_HANDLE_T) dispmanx_client.notify_buffer[1]);
> -          dispmanx_client.update_callback((DISPMANX_UPDATE_HANDLE_T) dispmanx_client.notify_buffer[1], dispmanx_client.update_callback_param);
> -       }
> -    }
> +diff --git a/interface/vmcs_host/vc_vchi_dispmanx.c b/interface/vmcs_host/vc_vchi_dispmanx.c
> +index 85b373c..59a01f8 100755
> +--- a/interface/vmcs_host/vc_vchi_dispmanx.c
> ++++ b/interface/vmcs_host/vc_vchi_dispmanx.c
> +@@ -1296,7 +1296,6 @@ static void *dispmanx_notify_func( void *arg ) {
> +          // Decrement the use count - the corresponding "use" is in vc_dispmanx_update_submit.
> +          vchi_service_release(dispmanx_client.notify_handle[0]);
> +          if (dispmanx_client.update_callback ) {
> +-            vcos_assert( dispmanx_client.pending_update_handle == handle);
> +             dispmanx_client.update_callback(handle, dispmanx_client.update_callback_param);
> +          }
> +       } else {
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index c738b62..8a71f93 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RPI_USERLAND_VERSION = ffcc4bd7c4875b71376c4240116e251652c9bec0
> +RPI_USERLAND_VERSION = 4333d6d023a1f0dcc763d0706a1fe6523f9b6005
>  RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
>  RPI_USERLAND_LICENSE = BSD-3c
>  RPI_USERLAND_LICENSE_FILES = LICENCE
> -- 
> 1.8.4.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
