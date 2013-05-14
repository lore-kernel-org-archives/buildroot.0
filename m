From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 May 2013 14:07:01 +0200
Subject: [Buildroot] [PATCH 2/3] libglib2: fix build when toolchain has
 no thread support
In-Reply-To: <1368532631-12983-2-git-send-email-s.martin49@gmail.com>
References: <1368532631-12983-1-git-send-email-s.martin49@gmail.com>
 <1368532631-12983-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20130514140701.2ff7178d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue, 14 May 2013 13:57:10 +0200, Samuel Martin wrote:

> +---
> +--- a/gio/gcancellable.c	2013-05-14 10:49:10.656384566 +0200
> ++++ b/gio/gcancellable.c	2013-05-14 12:38:46.339432786 +0200
> +@@ -263,6 +263,7 @@ g_cancellable_reset (GCancellable *cance
> + 
> +   g_return_if_fail (G_IS_CANCELLABLE (cancellable));
> + 
> ++#ifdef G_THREADS_ENABLED
> +   G_LOCK(cancellable);
> + 
> +   priv = cancellable->priv;
> +@@ -282,6 +283,7 @@ g_cancellable_reset (GCancellable *cance
> +       priv->cancelled = FALSE;
> +     }
> +   G_UNLOCK(cancellable);
> ++#endif
> + }
> + 
> + /**
> +@@ -612,6 +614,9 @@ g_cancellable_disconnect (GCancellable
> +   if (handler_id == 0 ||  cancellable == NULL)
> +     return;
> + 
> ++  g_return_if_fail (G_IS_CANCELLABLE (cancellable));
> ++
> ++#ifdef G_THREADS_ENABLED
> +   G_LOCK (cancellable);
> + 
> +   priv = cancellable->priv;
> +@@ -625,6 +630,7 @@ g_cancellable_disconnect (GCancellable
> + 
> +   g_signal_handler_disconnect (cancellable, handler_id);
> +   G_UNLOCK (cancellable);
> ++#endif
> + }


Are you sure about this patch? It completely removes the behavior of
the cancellation functions of glib, which may be used even if there are
no threads.

Are you sure that what needs to be removed is not just the G_LOCK() and
G_UNLOCK() calls ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
