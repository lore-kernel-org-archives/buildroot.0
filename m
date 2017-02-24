From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Feb 2017 18:15:12 +0100
Subject: [Buildroot] [PATCH] docs/website: Improving website speed
In-Reply-To: <1487803956-24668-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1487803956-24668-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <04b78ad5-5689-26e8-357e-1624d4bbbca7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Angelo,

On 22-02-17 23:52, Angelo Compagnucci wrote:
> Currently the buildroot website is not leveraging common
> techniques to have a better loading speed (browser caching,
> gzip compression, deflating).

 Sounds like a great idea. I had my doubts about the usefulness of
deflate/compress - most of our pages are relatively small, and the big ones
(e.g. bootstrap) come from a cdn. However, the news page for example is more
than 100K and that compresses nicely.

> This commit provides an .htaccess files with all the needed to
> enable mentioned features. This .htaccess only works if the
> webserver has deflate, expires and headers modules enabled.

 This is not phrased very well. It should be:

 This .htaccess file checks the modules that are available on
the webserver, and configures them appropriately if they are.


 The best way to test this, IMHO, is to just deploy it and run some timing
experiments on the server. Perhaps it would be nice if you could do a
measurement now, and then one after deployment, to see the improvement?

> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  docs/website/.htaccess | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 docs/website/.htaccess
> 
> diff --git a/docs/website/.htaccess b/docs/website/.htaccess
> new file mode 100644
> index 0000000..b02beb8
> --- /dev/null
> +++ b/docs/website/.htaccess
> @@ -0,0 +1,62 @@
> +# BEGIN Compress text files
> +<ifModule mod_deflate.c>
> +  <filesMatch ".(css|js|x?html?|php)$">
> +    SetOutputFilter DEFLATE
> +  </filesMatch>
> +</ifModule>
> +# END Compress text files

 What happens when the server has both deflate and gzip enabled?

> +
> +# BEGIN Expire headers
> +<ifModule mod_expires.c>
> +  ExpiresActive On
> +  ExpiresDefault "access plus 1 seconds"
> +  ExpiresByType image/x-icon "access plus 2592000 seconds"

 Please use "1 week" instead of "2592000 seconds". Or is the idea to use the
same numbers as in the Cache-Control headers?

> +  ExpiresByType image/jpeg "access plus 2592000 seconds"
> +  ExpiresByType image/png "access plus 2592000 seconds"
> +  ExpiresByType image/gif "access plus 2592000 seconds"

 So we have to make sure, if we ever update an image, that we give it a
different name. Which is a good idea anyway :-)

> +  ExpiresByType application/x-shockwave-flash "access plus 2592000 seconds"
> +  ExpiresByType text/css "access plus 604800 seconds"
> +  ExpiresByType text/javascript "access plus 216000 seconds"
> +  ExpiresByType application/javascript "access plus 216000 seconds"
> +  ExpiresByType application/x-javascript "access plus 216000 seconds"

 Hm, the only javascript we serve is js/buildroot.js, which is only 3507 bytes.
We would also have to change its name if we ever modify it, otherwise clients
are going to see inconsistent results for up to two days... I think it's better
to align this with the html time. Same goes for the css, we only have a total of
7KB of css.

> +  ExpiresByType text/html "access plus 600 seconds"
> +  ExpiresByType application/xhtml+xml "access plus 600 seconds"

 So, if the news page gets updated, it can take up to 10 hours before clients
see it. Seems OK.

> +</ifModule>
> +# END Expire headers
> +
> +# BEGIN Cache-Control Headers
> +<ifModule mod_headers.c>
> +  <filesMatch ".(ico|jpe?g|png|gif|swf)$">
> +    Header set Cache-Control "max-age=2592000, public"
> +  </filesMatch>
> +  <filesMatch ".(css)$">
> +    Header set Cache-Control "max-age=604800, public"
> +  </filesMatch>
> +  <filesMatch ".(js)$">
> +    Header set Cache-Control "max-age=216000, private"
> +  </filesMatch>
> +  <filesMatch ".(x?html?|php)$">
> +    Header set Cache-Control "max-age=600, private, must-revalidate"
> +  </filesMatch>
> +</ifModule>
> +# END Cache-Control Headers
> +
> +# BEGIN Turn ETags Off
> +<ifModule mod_headers.c>
> +  Header unset ETag

 Why turn etags off? Anyway, it is currently not turned on so this makes no
difference. But the way that we use our web pages, the best option would be to
use the Last-Modified header. It's currently not setting that. Do you know how
to enable it?

 Regards,
 Arnout

> +</ifModule>
> +FileETag None
> +# END Turn ETags Off
> +
> +# BEGIN gzip
> +<ifModule mod_gzip.c>
> +mod_gzip_on Yes
> +mod_gzip_dechunk Yes
> +mod_gzip_item_include file .(html?|txt|css|js)$
> +mod_gzip_item_include handler ^cgi-script$
> +mod_gzip_item_include mime ^text/.*
> +mod_gzip_item_include mime ^application/x-javascript.*
> +mod_gzip_item_exclude mime ^image/.*
> +mod_gzip_item_exclude rspheader ^Content-Encoding:.*gzip.*
> +</ifModule>
> +# END gzip
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
