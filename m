From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Oct 2018 23:26:54 +0100
Subject: [Buildroot] [PATCH 2/2] apache: pass explicit sbindir
In-Reply-To: <20180302180756.14315-2-chrismcc@gmail.com>
References: <20180302180756.14315-1-chrismcc@gmail.com>
 <20180302180756.14315-2-chrismcc@gmail.com>
Message-ID: <dfc941b2-0755-812e-d850-5927183334dc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?Hi Christopher,

?Sorry for the late reply...

On 02/03/2018 18:07, Christopher McCrory wrote:
> The apache configure script help indicates that the sbindir is
> PREFIX/sbin , but it actually uses PREFIX/bin.  Most people
> probably expect httpd to be located in /usr/sbin/httpd

?I disagree with this patch for 4 reasons:


- I don't think there is a real need. Upstream chooses to do it that way, why
would we differ?


- It is possible that someone is using apache and assumes it is installed in
/usr/bin.


- In fact, Buildroot does that, in the apache.service file. So at least that
file would need to be updated as well.


- If we want to change it, we should follow the upstream convention. Upstream
uses "layouts" to specify what goes where. There are layouts for Apache, GNU,
Fedora, Debian, RedHat, etc. So we should use a --enable-layout option instead
of hacking our own thing.


?With that in mind, I've marked the patch as Rejected in patchwork. If you do
think it is relevant, my second argument can be overridden, but then the patch
should be changed to fix the apache.service file and to use a --enable-layout
option instead.


?Regards,
?Arnout


>
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  package/apache/apache.mk | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index e1b1a209cb..4fd5896d59 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -28,7 +28,10 @@ else ifeq ($(BR2_PACKAGE_APACHE_MPM_WORKER),y)
>  APACHE_MPM = worker
>  endif
>  
> +# Explicitly pass sbindir, because apache configure script defines it
> +# to PREFIX/bin, which doesn't make much sense
>  APACHE_CONF_OPTS = \
> +	--sbindir=/usr/sbin \
>  	--sysconfdir=/etc/apache2 \
>  	--with-apr=$(STAGING_DIR)/usr \
>  	--with-apr-util=$(STAGING_DIR)/usr \
