From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jan 2013 17:27:48 +0100
Subject: [Buildroot] [RFC v1 05/14] autotools infrastructure: do the
 autoreconf as a post patch step
In-Reply-To: <510452A9.4050805@mind.be>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358725943-31485-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <510452A9.4050805@mind.be>
Message-ID: <20130127172748.29a8d6cf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sat, 26 Jan 2013 23:03:21 +0100, Arnout Vandecappelle wrote:
> On 01/21/13 00:52, Thomas Petazzoni wrote:
> > Doing the autoreconf step as a pre-configure hook doesn't work
> > properly, because the source directory is read-only during the
> > configure step. And in fact, the autoreconf process modifies the
> > source code, so it is quite logical to do it as part of the patching
> > process rather than the configuration process.
> 
>   It was in fact moved from POST_PATCH to PRE_CONFIGURE in commit 
> 89d1ad91fe4b1b65f0e902f94aba99a6cefbf631, and the PRE_CONFIGURE_HOOKS 
> were added specifically for this purpose. Unfortunately, the commit
> gives no explanation as to why it was needed.

Hum, right. Interesting. I've looked at the commits around this one,
and also the e-mails around the one through which this patch was
submitted, but it didn't give any clue. The other patches around are
version bumps and other, seemingly unrelated things.

It's even more disappointing that I was amongst the people giving a
Acked-by on this patch...

One reason that might explain this is the lack of ordering guarantees
on post patch hooks. For example, if you have a post patch hook that
applies Debian patches, and a post patch hook to do the autoreconf, you
quite certainly want the Debian patches hook to be executed before the
autoreconf hook. But I have absolutely no idea if this is the problem
that we were trying to fix here.

That said, I still believe that the autoreconf thing belongs to the
patch step. It is really a modification of the source code itself, and
it is common to both the target build and host build. So maybe the
autotools infrastructure needs a special hook in the generic
infrastructure (rather than a normal post patch hook), to ensure that
the autoreconf step gets executed after all post patch hooks?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
