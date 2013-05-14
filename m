From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 14 May 2013 23:23:18 +0200
Subject: [Buildroot] [PATCH 2/3] libglib2: fix build when toolchain has
 no thread support
In-Reply-To: <20130514140701.2ff7178d@skate>
References: <1368532631-12983-1-git-send-email-s.martin49@gmail.com>
 <1368532631-12983-2-git-send-email-s.martin49@gmail.com>
 <20130514140701.2ff7178d@skate>
Message-ID: <CAHXCMM+5DR=+09o4Ux-pok2cOCy+WaeVDfQ4vsVvtgwgsJAzHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

2013/5/14 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Samuel Martin,
>
> On Tue, 14 May 2013 13:57:10 +0200, Samuel Martin wrote:
>
>> +---
>> +--- a/gio/gcancellable.c     2013-05-14 10:49:10.656384566 +0200
>> ++++ b/gio/gcancellable.c     2013-05-14 12:38:46.339432786 +0200
>> +@@ -263,6 +263,7 @@ g_cancellable_reset (GCancellable *cance
>> +
>> +   g_return_if_fail (G_IS_CANCELLABLE (cancellable));
>> +
>> ++#ifdef G_THREADS_ENABLED
>> +   G_LOCK(cancellable);
>> +
>> +   priv = cancellable->priv;
>> +@@ -282,6 +283,7 @@ g_cancellable_reset (GCancellable *cance
>> +       priv->cancelled = FALSE;
>> +     }
>> +   G_UNLOCK(cancellable);
>> ++#endif
>> + }
>> +
>> + /**
>> +@@ -612,6 +614,9 @@ g_cancellable_disconnect (GCancellable
>> +   if (handler_id == 0 ||  cancellable == NULL)
>> +     return;
>> +
>> ++  g_return_if_fail (G_IS_CANCELLABLE (cancellable));
>> ++
>> ++#ifdef G_THREADS_ENABLED
>> +   G_LOCK (cancellable);
>> +
>> +   priv = cancellable->priv;
>> +@@ -625,6 +630,7 @@ g_cancellable_disconnect (GCancellable
>> +
>> +   g_signal_handler_disconnect (cancellable, handler_id);
>> +   G_UNLOCK (cancellable);
>> ++#endif
>> + }
>
>
> Are you sure about this patch? It completely removes the behavior of
> the cancellation functions of glib, which may be used even if there are
> no threads.
Well, I thought that glib handles that too, but without this patch I
always trigger the following error
(using this unchanged config:
http://autobuild.buildroot.net/results/d49/d491de5a774592929a59f3bfd0b1fd8cbc089ac0/config):
---
libtool: compile:  /opt/br-output/cairo-fix/host/usr/bin/arm-linux-gcc
-DHAVE_CONFIG_H -I. -I..
-I/opt/br-output/cairo-fix/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
-DG_LOG_DOMAIN=\"GLib-GIO\" -I.. -I../glib -I../glib -I.. -I../gmodule
-DG_DISABLE_CAST_CHECKS -DG_THREADS_MANDATORY -DG_DISABLE_DEPRECATED
-DGIO_COMPILATION -DGIO_MODULE_DIR=\"/usr/lib/gio/modules\"
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DG_DISABLE_SINGLE_INCLUDES -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os -g2 -Wall -MT
libgio_2_0_la-gcancellable.lo -MD -MP -MF
.deps/libgio_2_0_la-gcancellable.Tpo -c gcancellable.c  -fPIC -DPIC -o
.libs/libgio_2_0_la-gcancellable.o
gcancellable.c: In function 'g_cancellable_reset':
gcancellable.c:273:7: error 'g__cancellable_lock' undeclared (first
use in this function)
gcancellable.c:273:7: note: each undeclared identifier is reported
only once for each function it appears in
gcancellable.c: In function 'g_cancellable_disconnect':
gcancellable.c:622:7: error 'g__cancellable_lock' undeclared (first
use in this function)
make[5]: *** [libgio_2_0_la-gcancellable.lo] Error 1
---

>
> Are you sure that what needs to be removed is not just the G_LOCK() and
> G_UNLOCK() calls ?
Actually, it's g_cond_wait that triggers this build failure.
Looking at its definition, it should do nothing when thread support is
disabled...

Note that a more finely grained patch, disabling only the g_cond_wait
call, is enough to fix this build issue.


Regards,

-- 
Samuel
