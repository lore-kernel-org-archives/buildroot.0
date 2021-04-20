From: jean-pierre cartal <jpcartal@free.fr>
Date: Tue, 20 Apr 2021 09:09:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix dbus system
 socket location
In-Reply-To: <0C16DA8B-D53E-41B6-B76A-9BE0B8955F72@free.fr>
References: <20210415144226.2354048-1-jpcartal@free.fr>
 <20210419232810.4ceef826@windsurf.home>
 <0C16DA8B-D53E-41B6-B76A-9BE0B8955F72@free.fr>
Message-ID: <ceb7b06a-03c3-df2d-45c4-8fe4b6f0ec55@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

After further checking, I realized that because of historical reasons 
we've been mounting a tmpfs directory on top on /var as part of the boot 
process, hence loosing the /var/run -> /run link in the process.

Sorry for the erroneous patch.

Regards
Le 19/04/2021 ? 23:43, Jean-pierre Cartal a ?crit?:
> Hello Thomas,
>
> We recently moved to the new 2021.02.x LTS version from previous 
> 2020.02.x LTS version.
>
> While testing this new branch we discovered that we could not connect 
> to dbus anymore when using libglib2 because the dbus socket location 
> changed from /var/run to /run.
>
> I'll double check tomorrow but I'm quite sure that those are 2 
> distinct directories and not a symlink in our builds.
>
> Regards
>
> Le 19 avril 2021 23:28:10 GMT+02:00, Thomas Petazzoni 
> <thomas.petazzoni@bootlin.com> a ?crit :
>
>     Hello Jean-Pierre,
>
>     +Norbert in Cc, since he changed the DBus socket location in commit
>     6b9a75a5bd1b1a559b7352003588d1461de8c4d1.
>
>     On Thu, 15 Apr 2021 16:42:26 +0200
>     Jean-pierre Cartal <jpcartal@free.fr> wrote:
>
>         Fix dbus system socket location moved from
>         /var/run/dbus/system_bus_socket to /run/dbus/system_bus_socket
>         Signed-off-by: Jean-pierre Cartal <jpcartal@free.fr>
>         ------------------------------------------------------------------------
>         package/libglib2/0005-dbus-system-socket-path.patch | 11
>         +++++++++++ 1 file changed, 11 insertions(+) create mode
>         100644 package/libglib2/0005-dbus-system-socket-path.patch
>         diff --git
>         a/package/libglib2/0005-dbus-system-socket-path.patch
>         b/package/libglib2/0005-dbus-system-socket-path.patch new file
>         mode 100644 index 0000000000..bb2ec33dc6 --- /dev/null +++
>         b/package/libglib2/0005-dbus-system-socket-path.patch @@ -0,0
>         +1,11 @@ +diff -Naur libglib2-2.66.8.orig/gio/gdbusaddress.c
>         libglib2-2.66.8/gio/gdbusaddress.c +---
>         libglib2-2.66.8.orig/gio/gdbusaddress.c 2021-03-18
>         14:47:48.256693000 +0100 ++++
>         libglib2-2.66.8/gio/gdbusaddress.c 2021-04-15
>         16:14:28.519296584 +0200 +@@ -1331,7 +1331,7 @@ + + if (ret ==
>         NULL) + { +- ret = g_strdup
>         ("unix:path=/var/run/dbus/system_bus_socket"); ++ ret =
>         g_strdup ("unix:path=/run/dbus/system_bus_socket"); + } + break; 
>
>
>     On the form, all patches in Buildroot need to have a proper commit
>     description and Signed-off-by line.
>
>     But on the actual content, I am wondering if this is the right
>     direction to take. Do we want to keep this non-upstreamable patch
>     around forever ?
>
>     According to commit 6b9a75a5bd1b1a559b7352003588d1461de8c4d1, /var/run
>     is supposed to be a symlink to /run, so your patch should be a no-op.
>     Both our systemd and sysv skeletons ensure this symlink exist.
>
>     Could you provide more details about the issue ?
>
>     Thomas
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
