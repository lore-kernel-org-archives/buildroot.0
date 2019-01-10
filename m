From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Jan 2019 22:25:25 +0100
Subject: [Buildroot] [PATCH next v6 07/10] core: implement per-package
 SDK and target
In-Reply-To: <CAAXf6LVJ6-H-pBA8C9i8LJxmQ=8ufdvOC3uHG5-cqz-WPyt=sg@mail.gmail.com>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-8-thomas.petazzoni@bootlin.com>
 <1f520844-5501-a60b-cf66-5bae57b9f420@andin.de>
 <20181205173103.1eb30a7b@windsurf>
 <672791f3-4383-cad2-f31c-5362b94b94fb@andin.de>
 <8a886731-26ee-ba33-f303-81d5bd0e7954@andin.de>
 <20181226183422.76c6ff6c@windsurf.home>
 <CAAXf6LVJ6-H-pBA8C9i8LJxmQ=8ufdvOC3uHG5-cqz-WPyt=sg@mail.gmail.com>
Message-ID: <30afb67d-f31d-4986-8490-2e97f5808eda@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/12/2018 19:33, Thomas De Schampheleire wrote:
> In a similar context I once had following problem:
> http://lists.busybox.net/pipermail/buildroot/2018-August/226955.html
> This was for target binaries, rather than host, but for the below
> discussion it does not matter.

 I don't think you ever replied to my question in that thread:

 Let's first find out why it is cleared. patchelf should check for each
directory in rpath if it is actually needed, and only remove it if it is not
needed. So, what library do you have in /opt/foobar/lib, and is it really linked
with the program?

 Hm, I realize that we never thought about dlopen()ed libraries. Could that be
the cause? I guess that hasn't been a problem up to now because usually programs
using dlopen() will use an absolute path (to a build-time or run-time configured
plugin directory) rather than relying on RPATH.



> Looking back at this problem, taking into account the above comment
> from the patchelf patch, I would say that my problem would have been
> fixed if case (4) above would not discard the path.

 I think one motivation for removing redundant rpaths is to avoid having build
directories leaking into target binaries. Especially for reproducible builds
this is important.


> If that change would be adopted, then it would also preserve the rpath
> '/home/thomas/projets/buildroot/output/per-package/host-e2fsprogs/host/lib'.
> 
> Of course, in your case you might actually want a different final
> rpath, i.e. rewrite it to the consolidated host directory. I think
> that in this case it would be better to read the rpath via patchelf,
> calculate the transformed rpath from our own script, then writing it
> back via patchelf,  rather than adding more options into patchelf with
> e.g. transformation rules.

 The problem is that patchelf is rather slow, so running it twice is even slower...

 Regards,
 Arnout
