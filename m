From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 25 Feb 2017 00:02:10 +0100
Subject: [Buildroot] [PATCH] docs/website: Improving website speed
In-Reply-To: <CA+TH9VnSf=1Vm0v6C__dU8ORoge6FXQo1FNzoHWAkahkP5AQMw@mail.gmail.com>
References: <1487803956-24668-1-git-send-email-angelo.compagnucci@gmail.com>
 <04b78ad5-5689-26e8-357e-1624d4bbbca7@mind.be>
 <CA+TH9VnSf=1Vm0v6C__dU8ORoge6FXQo1FNzoHWAkahkP5AQMw@mail.gmail.com>
Message-ID: <260839fd-6e0e-01e1-3823-63152469c693@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-02-17 19:24, Angelo Compagnucci wrote:
> Dear Arnout Vandecappelle,
> 
> 2017-02-24 18:15 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>>  Hi Angelo,
>>
>> On 22-02-17 23:52, Angelo Compagnucci wrote:
>>> Currently the buildroot website is not leveraging common
>>> techniques to have a better loading speed (browser caching,
>>> gzip compression, deflating).

[snip]

>>  The best way to test this, IMHO, is to just deploy it and run some timing
>> experiments on the server. Perhaps it would be nice if you could do a
>> measurement now, and then one after deployment, to see the improvement?
> 
> There is a tool for that and what I'm currently using [1].

 For those who don't speak Italian: [4] :-) But it doesn't report any actual
speeds, does it? It just says "minifying CSS can save 1008 bytes". So for
comparing performance before/after it doesn't do much.

[snip]
>>> +# BEGIN Turn ETags Off
>>> +<ifModule mod_headers.c>
>>> +  Header unset ETag
>>
>>  Why turn etags off? Anyway, it is currently not turned on so this makes no
>> difference. But the way that we use our web pages, the best option would be to
>> use the Last-Modified header. It's currently not setting that. Do you know how
>> to enable it?
> 
> You can read the explaination here [2] and related resources.

 That site refers to two others (Google and Yahoo) that both say to enable ETags
if appropriate... Google just says to enable ETags, Yahoo says to disable it
when the same site is provided by multiple servers - which is not the case for
us AFAIK. In addition, your [1] says to "Leverage browser caching", refering to
[5] that says to enable ETags again (both are Google so that makes sense).

[snip]
> I think there is a bit of confusion on browser caching here. Browser
> caching is always client side and these we are making here are only
> suggestions to the browser. When a browser requests a content, if the
> content is changed, it gets the new content. If the server instead
> gives enough information, the browser could decide to not download the
> resource cause it matches with the cache. Without enough information,
> the browser follow the secure behavior to get always the full resource
> from web.
> Caching behavior could be easily circumvented using CTRL+F5 cause it's
> totally a client side decision to get the full content from server or
> the cache.
> So having an .htaccess gives the needed hints to the browser on how
> handle the cache and decide when download the full content.
> Obviously if an image file has changed the user will get new image. I
> think that if this not were the default behavior the web have imploded
> from quite some time!

 No that's not true. The browser can't know that the image has changed, except
by downloading it again... The Last-Modified-Time and ETags headers are supposed
to work around that, by allowing the browser to just issue the request and not
wait for the full download. The Cache-Control is of course better, because then
the browser doesn't have to make any request. But the problem is that the
webserver can't accurately predict when the content will change. So you just
give a hint of how long it's going to stay valid.


> Honestly I don't want to fine tuning each one of this settings. They
> are based on proven standards (Ex: [2]), there are tons of examples
> online.
> We serve only static content and the 95% of the website is not changed
> for a year at least, so suggesting to the browser to cache the most
> seems sensible to me.
> If an user do really want to see the latest content, to be sure he
> could always hit CRTL+F5 or clear the browser cache.

 Sure, that's why I said the 10 minutes for the html is OK. However, I am
concerned about the two css files and the javascript file. It is likely that
they are updated together with the html. E.g., a javascript function would be
added in buildroot.js and used in news.html. If the two files have a different
expiry time, then the browser will use the new HTML file with the old javascript
file, with who knows what kind of strange results.

 Note that I'm concerned about this out of a bad experience. Guess how we solved
it? With ETags :-) Not that I'm sure that it was the best solution though.

 "Professional" website solve this by versioning the resources. Basically when
deploying, buildroot.js would be renamed to buildroot.42.js and all references
to it in html files are updated as well. This way, if the js file changes, its
name changes as well so it is automatically uncached. Also, if a cached HTML
file is used, it will still point to the old version of the js file so it's
consistent.

 However, I don't think that we want to go there - it requires complicated
deployment, for limited gain.

 What could be done, on the other hand, is to use server-side includes for the
css and js. But that's a separate patch of course.


> On the google page speed insights you can find tons of suggestions and
> good practices to get the most from your website.

 Note that you didn't do anything about what Google identifies as the most
critical issue.

> For the deflate/gzip question: enabling both means that the browser
> could choose what to request and how. The rationale here is that cpu
> cycles are free on a 3G/4G connected device, bytes or megabytes of
> traffic are not.
> 
> If you like cosmetic changes to do (like "1 week" instead of seconds)
> I can do that.

 Unless if you say that you want to keep the number the same in expires and
Cache-Control, which does make sense.

 Either way, you can add my

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Even if it's not perfect yet, it's certainly an improvement.


 Regards,
 Arnout


> 
> Sincerely, Angelo.
> 
> 
> [1] https://developers.google.com/speed/pagespeed/insights/?hl=IT&url=https%3A%2F%2Fbuildroot.org
> [2] https://htaccessbook.com/disable-etags/
> [3] http://www.seomix.fr/guide-htaccess-performances-et-temps-de-chargement/

[4]
https://developers.google.com/speed/pagespeed/insights/?hl=EN&url=https%3A%2F%2Fbuildroot.org
[5] https://developers.google.com/speed/docs/insights/LeverageBrowserCaching



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
