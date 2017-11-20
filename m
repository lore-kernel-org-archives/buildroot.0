From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Nov 2017 22:14:45 +0100
Subject: [Buildroot] [PATCH 1/1] freerdp: fix wayland client dependency
 chain failure
In-Reply-To: <20171120084757.04cf0411@windsurf>
References: <20171119214852.27459-1-Adamduskett@outlook.com>
 <20171120084757.04cf0411@windsurf>
Message-ID: <20171120211445.GA2867@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Adam, All,

On 2017-11-20 08:47 +0100, Thomas Petazzoni spake thusly:
> On Sun, 19 Nov 2017 16:48:52 -0500, Adam Duskett wrote:
> > If the wayland client is selected, freerdp depends on libxkbcommon without
> > depending on it in the mk file.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/dc3/dc3e11f7076a8355f3d2f9cb49c6325dcf7084bd
> > Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> > ---
> >  package/freerdp/freerdp.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> > index 69a89a190c..29c35164c3 100644
> > --- a/package/freerdp/freerdp.mk
> > +++ b/package/freerdp/freerdp.mk
> > @@ -207,6 +207,10 @@ else
> >  FREERDP_CONF_OPTS += -DWITH_WAYLAND=OFF
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_FREERDP_CLIENT_WL),y)
> > +FREERDP_DEPENDENCIES += libxkbcommon
> > +endif
> 
> https://git.buildroot.org/buildroot/commit/?id=c2824fba2f2f4df6c1e0273fa546a203d1e6d5ac
> already makes libxkbcommon a dependency of freerdp when wayland is
> enabled. Isn't this sufficient ?

I think the current code might indeed not be correct, but that the patch
is not correct either...

The issue with FreeRDP, as much as I can remember, is the way it builds
the clients: either clients are enabled ot they are not. But once you
enable clients, it will look for dependencies of each client, and build
those whose dependencies are met.

So, if you have X11 and wayland libs around, then FreeRDP will biuld
both clients, even if you are only interested in one and not both.

The situation where you want only (say) the wayland client and not the
X11 one is if you are running a wayland system, with XWayland to run
legacy X11 apps ontop of this, and only want to use FreeRDP as a wayland
client.

So we have code in freerdp.mk to get rid of the unneeded client(s).

But now, the select and dependency on libxbcommon are under two slightly
different conditions:

  - the select is only when the wayland client is enabled,
  - the dependency is when the wayland package is enabled.

Now, if the wayland client is disabled, but the walyand package is
enabled, then nothing from FreeRDP selects libxbkcommon, but it ends up
in the dependency chain of FreeRDP nonetheless.

I think a better patch would be something like:

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 69a89a190c..0ceef576a8 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -198,7 +198,7 @@ else
 FREERDP_CONF_OPTS += -DWITH_XV=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_WAYLAND),y)
+ifeq ($(BR2_PACKAGE_FREERDP_CLIENT_WL),y)
 FREERDP_DEPENDENCIES += wayland libxkbcommon
 FREERDP_CONF_OPTS += \
 	-DWITH_WAYLAND=ON \

TBH, I'm a bit under the weather those days, so Adam, I'd be gratefull
if you were to check the above, please.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
