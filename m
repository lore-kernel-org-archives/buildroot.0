From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 15:57:19 +0100
Subject: [Buildroot] [PATCHv5 1/9] support/download: reintroduce
 'source-check' target
In-Reply-To: <20190317143215.GD14237@scaer>
References: <20190219103839.25409-1-patrickdepinguin@gmail.com>
 <20190317143215.GD14237@scaer>
Message-ID: <20190317155719.14839925@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Mar 2019 15:32:15 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> As discussed with Thomas P., it all depends on the semantics we want to
> give to source-check. But the one implemented by your series does not
> seem that interesting in the end. Yes, it makes your remote-worker-with-
> a-slow-connection maybe a bit more bearable.
> 
> It also means that all it says is that, right at the time of source-check,
> here is actually "something" named as you expect, but there is no
> guarantee that a 'make source' later will be able to get that "something"
> anyway.
> 
> So, I am still not entirely convinced by the usefulness of source-check.

Just to add to Yann's explanations, here are the two aspects that makes
the proposed semantic of "source-check" a bit weak:

 - It only says "something" was available at the specified download
   location, but not that this something matches the hash we have in
   the package hash file. Hence a successful "make source-check" does
   not guarantee a successful "make source".

 - It only says at the time of "make source-check" that "something" was
   available at the specified download location, but 2 minutes later
   the file could be removed upstream, the tag be dropped, etc. Hence a
   successful "make source-check" does not guarantee a successful "make
   source".

So, a "make source-check" does not provide you much guarantees. It only
tells you that at the time of the source-check, "something" was
available at the specified download location, but you don't know if
that "something" is correct and that it will still be around when
you'll do your build.

If we are willing to accept this very weak semantic of source-check,
then fair enough, but we (and our users) have to be aware of the very
limited guarantees that source-check provides.

What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
