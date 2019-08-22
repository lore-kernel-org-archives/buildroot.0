From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2019 22:05:24 +0200
Subject: [Buildroot] Help with forcing a rebuild of the target
In-Reply-To: <f24ed451-f97c-b75c-e4e7-2c662b96c0c1@jcornell.net>
References: <f24ed451-f97c-b75c-e4e7-2c662b96c0c1@jcornell.net>
Message-ID: <6089b94e-048b-90a1-76fa-f4132e45e3f7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/08/2019 01:32, Jakob Cornell wrote:
> Hi all,
> 
> I've been working with Buildroot for a few weeks, and I occasionally find that I
> want to undo a change I've made to the 'output/target' tree. This is usually
> because I want to remove a file previously added using an overlay or because
> there are stale files leftover from a package that I've deselected.

 This is exactly why we don't offer support for such a feature: if there are
stale files left over in target, there are also stale files left over in
staging. In that case, it's possible that some other package links with those
files, which will succeed. But at runtime, it won't work because the files
aren't there on target.

 Even if there were a solution for that, it's not sufficient. You need to
rebuild all the packages that depend on the package you just removed. However,
since you just removed the package, you can't now any more which packaged
depended on it.


 Regards,
 Arnout


> So what I want to do, ideally, is run everything needed to fully populate the
> target filesystem, but also ensure that only what's needed is there. I've tried
> removing 'output/target' or individual files in it, but that often breaks the
> build. I've been resorting to doing a full clean and build, which is very
> wasteful. Is there any way to clean out the target tree and rebuild it without
> having to recompile anything?
> 
> Thanks,
> Jakob
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
