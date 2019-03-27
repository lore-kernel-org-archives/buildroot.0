From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Mar 2019 14:46:32 +0100
Subject: [Buildroot] [PATCHv5 1/9] support/download: reintroduce
 'source-check' target
In-Reply-To: <20190317155719.14839925@windsurf>
References: <20190219103839.25409-1-patrickdepinguin@gmail.com>
 <20190317143215.GD14237@scaer> <20190317155719.14839925@windsurf>
Message-ID: <69fd8276-ea53-75a5-240a-a0e146cd8b62@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/03/2019 15:57, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 17 Mar 2019 15:32:15 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
>> As discussed with Thomas P., it all depends on the semantics we want to
>> give to source-check. But the one implemented by your series does not
>> seem that interesting in the end. Yes, it makes your remote-worker-with-
>> a-slow-connection maybe a bit more bearable.
>>
>> It also means that all it says is that, right at the time of source-check,
>> here is actually "something" named as you expect, but there is no
>> guarantee that a 'make source' later will be able to get that "something"
>> anyway.
>>
>> So, I am still not entirely convinced by the usefulness of source-check.
> 
> Just to add to Yann's explanations, here are the two aspects that makes
> the proposed semantic of "source-check" a bit weak:
> 
>  - It only says "something" was available at the specified download
>    location, but not that this something matches the hash we have in
>    the package hash file. Hence a successful "make source-check" does
>    not guarantee a successful "make source".
> 
>  - It only says at the time of "make source-check" that "something" was
>    available at the specified download location, but 2 minutes later
>    the file could be removed upstream, the tag be dropped, etc. Hence a
>    successful "make source-check" does not guarantee a successful "make
>    source".
> 
> So, a "make source-check" does not provide you much guarantees. It only
> tells you that at the time of the source-check, "something" was
> available at the specified download location, but you don't know if
> that "something" is correct and that it will still be around when
> you'll do your build.
> 
> If we are willing to accept this very weak semantic of source-check,
> then fair enough, but we (and our users) have to be aware of the very
> limited guarantees that source-check provides.

 For the use case of Thomas DS, this weak semantic is perfectly fine. What it
tries to protect against is the common mistake that you add or bump a package
and forget to upload the source to PRIMARY_SITE. As explained by Thomas DS,
doing a full download is eventually still needed, but takes much longer:
source-check may take in the order of 1 minute while the full download takes 10
minutes. That makes all the difference for immediate feedback to the developer,
and it doesn't significantly slow down a good pipeline.

 Indeed, it does not protect against uploading the wrong tarball with the
correct name. It also doesn't protect against forgetting to update the hash
file. It also doesn't protect against the package failing to build. It also
doesn't protect against bugs in the code which become only apparent at run time.
But all of these are checked later in CI, and the source check captures an
important (and likely) class of mistakes early on.

 It is true that this is a very narrow use case. However, I think it passes two
tests for acceptance:

* It does not make Buildroot (much) more complex.

* There is no way to do this with scripting outside of Buildroot.

 Regarding that second point: in fact there would be a way, if we would instead
have a command to print everything that would be downloaded. That would be very
similar to patch 1/9, but would remove the need for the other patches in the
series. The advantage of this approach is that there could be other uses for
printing the list of sources. But that would be back to the drawing board for
Thomas DS, so I doubt he's enthusiastic about that option :-) Plus, we have no
actual example of an additional use case.

 Regards,
 Arnout
