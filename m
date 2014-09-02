From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 2 Sep 2014 17:06:25 +0200
Subject: [Buildroot] [PATCH v3] nginx: new package
In-Reply-To: <1407140724-6472-1-git-send-email-s.martin49@gmail.com>
References: <1407140724-6472-1-git-send-email-s.martin49@gmail.com>
Message-ID: <CAJtjsKarnf787VRmOALuwLKGi5cEjr+C4xCOrB6SE1s-rVUxfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel, All,

I made few changes to your patch to make in work on my Raspberry PI.
See inline comments below.

On Mon, Aug 4, 2014 at 10:25 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> +++ b/package/nginx/S50nginx
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +#
> +# Start/stop nginx
> +#
> +
> +PIDFILE=/var/run/nginx.pid
> +
> +case "$1" in
> +  start)
> +       echo "Starting nginx..."
> +       start-stop-daemon -S -x -p $PIDFILE nginx

The -p option does not work in this position:
$ /etc/init.d/S50nginx start
Starting nginx...
start-stop-daemon: can't execute '-p': No such file or directory

According to start-stop-daemon manual:
-p, --pidfile pid-file
              Check whether a process has created  the  file  pid-file.  Note:
              using  this  matching  option  alone might cause unintended pro?
              cesses to be acted on, if the  old  process  terminated  without
              being able to remove the pid-file.

       -x, --exec executable
              Check  for  processes that are instances of this executable. The
              executable argument should be an absolute pathname.  Note:  this
              might not work as intended with interpreted scripts, as the exe?
              cutable will point to the interpreter. Take  into  account  pro?
              cesses  running  from  inside  a chroot will also be matched, so
              other match restrictions might be needed.

Thus, the following command works:
start-stop-daemon -S -x /usr/sbin/nginx -p $PIDFILE


> +esac
> +
> +exit $?

People from this mailing list told me to remove this last line as it
is already the default behavior of a script to return the last command
result.

> +NGINX_VERSION = 1.6.0

1.6.1 has been released since you've submitted this patch. You might
consider to updated it if you submit a new version.

> +
> +NGINX_CONF_OPT += \
> +       --prefix=/usr \

You should use /usr/nginx. Otherwise, it will create an html folder in /usr.

> +       --conf-path=/etc/nginx/nginx.conf \
> +       --sbin-path=/usr/bin/nginx \

it should be /usr/sbin/nginx

> +       --pid-path=/var/run/nginx.pid \

I think we should prefer /run instead of /var/run. The later is now
deprecated and is usually a symbolic link to /run

> +       --lock-path=/var/lock/nginx.lock \
> +       --user=www-data \
> +       --group=www-data \
> +       --error-log-path=stderr \

It's annoying to have every nginx error printed on stderr. Use
/var/log/nginx/error.log instead.

> +       --http-client-body-temp-path=/var/lib/nginx/client-body \
> +       --http-proxy-temp-path=/var/lib/nginx/proxy \
> +       --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
> +       --http-scgi-temp-path=/var/lib/nginx/scgi \
> +       --http-uwsgi-temp-path=/var/lib/nginx/uwsgi

I think /var/tmp should be used instead of /var/lib for these temporary folders.

Thanks again for your work. That's great to have nginx on buildroot ;-)

-- 
Johan
