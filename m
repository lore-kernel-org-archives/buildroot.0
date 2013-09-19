From: Michael Rommel <rommel@layer-7.net>
Date: Thu, 19 Sep 2013 15:56:29 +0200
Subject: [Buildroot] [PATCH 1/1] package: remove the trailing slash sign
	from the URL address
In-Reply-To: <523A2DC7.7010202@mind.be>
References: <1379517858-28720-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <CAAXf6LU8GCW7vwVvoBrSeTaongix761F=DT1Tbh=qJ_3m32CMw@mail.gmail.com>
 <523A2DC7.7010202@mind.be>
Message-ID: <5A95E57D-D33E-4AAF-9D83-8C6ECEBCD0D6@layer-7.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Arnout and Jerzy,

of course, Arnout is right that the change of the URLs in the _SITE variables is not that relevant.
My comment was more targeted to all the other URLs for the upstream projects. Which I now see,
was not part of your original patch submission. Sorry, that I overlooked that.

But since I thought you overall wanted to have more consistency with all the URLs, I decided
to quickly analyse what else we do have in our Config.ins:

Apart from the _SITE URLs, we have:
 - 751 packages, where another URL is used to point to the upstream project
 - 465 of these 751 had a trailing slash at the end of the URL

I then tried to analyse, whether there is a need to modify them:
 - 726 were HTTP Urls where the server responded with:
	535		200 OK
	132		301 Moved Permanently
	42		302
	1		400
	2		403
	13		404
	1		500
- 71 of the 132 moved URLs had a trailing slash at the end of their new locations.

Used scripts:
find package/ -name "Config.in" -exec egrep -i "  (ht|f)tp://.*$" {} \; >../buildroot-urls.txt
cat buildroot-urls.txt |xargs -i ./show_response.sh {} >buildroot-checked-urls.txt
egrep "^HTTP" buildroot-checked-urls.txt |sed -e "s/HTTP\/.\.. \(...\) .*$/\1/g" | sort | uniq -c

show_response.sh just invokes curl.
#! /bin/bash
ARG=$*
echo "Original URL: " $ARG
echo "Response: "
curl -I $ARG 2>/dev/null |egrep "^(HTTP/|Location:)"
echo

I made the input files available at: 

  http://michaelrommel.com/buildroot-urls.txt
  http://michaelrommel.com/buildroot-checked-urls.txt
  http://michaelrommel.com/buildroot-moved-urls.txt

to avoid clutter on this list.

  Michael.
 
-- 
Michael Rommel, Erlangen, Germany

On Sep 19, 2013, at 0:48 , Arnout Vandecappelle <arnout@mind.be> wrote:

> On 18/09/13 17:34, Thomas De Schampheleire wrote:
>> Hi Jerzy,
>> 
>> Op 18-sep.-2013 17:25 schreef "Jerzy Grzegorek"
>> <jerzy.grzegorek at trzebnica.net <mailto:jerzy.grzegorek@trzebnica.net>>
>> het volgende:
>> >
>> > Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net
>> <mailto:jerzy.grzegorek@trzebnica.net>>
>> > ---
>> 
>> Could you clarify why this is desirable? Note that urls with our without
>> trailing slash are not identical: the web server needs to properly
>> support this. For example, the autobuild website does not properly do it
>> (something very annoying ;) )
>> 
>> So, with a change like this, every changed url needs to be tested.
> 
> Well, with the trailing slash is stripped by pkg-generic.mk:
> 
> $(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE))
> 
> So functionally it doesn't matter if the / is there or not.
> 
> I'm pretty much in favour of removing the /.
> 
> Regards,
> Arnout
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
