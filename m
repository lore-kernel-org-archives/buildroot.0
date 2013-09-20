From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 20 Sep 2013 08:23:22 +0200
Subject: [Buildroot] [PATCH 1/1] package: remove the trailing slash sign
 from the URL address
In-Reply-To: <5A95E57D-D33E-4AAF-9D83-8C6ECEBCD0D6@layer-7.net>
References: <1379517858-28720-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <CAAXf6LU8GCW7vwVvoBrSeTaongix761F=DT1Tbh=qJ_3m32CMw@mail.gmail.com>
 <523A2DC7.7010202@mind.be> <5A95E57D-D33E-4AAF-9D83-8C6ECEBCD0D6@layer-7.net>
Message-ID: <523BE9DA.7080108@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Michael,

Thanks for your feedback.


> Hi Arnout and Jerzy,
>
> of course, Arnout is right that the change of the URLs in the _SITE variables is not that relevant.
> My comment was more targeted to all the other URLs for the upstream projects. Which I now see,
> was not part of your original patch submission. Sorry, that I overlooked that.


No problem.
Yes, the subject of my patch submission is removing the trailing slash 
from _SITE variables only.
I see now that the title is a little bit misleading.


> But since I thought you overall wanted to have more consistency with all the URLs, I decided
> to quickly analyse what else we do have in our Config.ins:
>
> Apart from the _SITE URLs, we have:
>   - 751 packages, where another URL is used to point to the upstream project
>   - 465 of these 751 had a trailing slash at the end of the URL
>
> I then tried to analyse, whether there is a need to modify them:
>   - 726 were HTTP Urls where the server responded with:
> 	535		200 OK
> 	132		301 Moved Permanently
> 	42		302
> 	1		400
> 	2		403
> 	13		404
> 	1		500
> - 71 of the 132 moved URLs had a trailing slash at the end of their new locations.
>
> Used scripts:
> find package/ -name "Config.in" -exec egrep -i "  (ht|f)tp://.*$" {} \; >../buildroot-urls.txt
> cat buildroot-urls.txt |xargs -i ./show_response.sh {} >buildroot-checked-urls.txt
> egrep "^HTTP" buildroot-checked-urls.txt |sed -e "s/HTTP\/.\.. \(...\) .*$/\1/g" | sort | uniq -c
>
> show_response.sh just invokes curl.
> #! /bin/bash
> ARG=$*
> echo "Original URL: " $ARG
> echo "Response: "
> curl -I $ARG 2>/dev/null |egrep "^(HTTP/|Location:)"
> echo
>
> I made the input files available at:
>
>    http://michaelrommel.com/buildroot-urls.txt
>    http://michaelrommel.com/buildroot-checked-urls.txt
>    http://michaelrommel.com/buildroot-moved-urls.txt


Interesting...
I think, this information will certainly be useful for the BR upstream 
projects
and patches.

Regards,
Jerzy


> to avoid clutter on this list.
>
>    Michael.
>   
