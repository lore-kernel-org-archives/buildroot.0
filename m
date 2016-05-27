From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 May 2016 07:23:32 +0200
Subject: [Buildroot] [PATCH v3 1/3] runc: new package
In-Reply-To: <1464294094194-a799811f-1fe2864f-ad38cf3d@mixmax.com>
References: <1464219082-3818-1-git-send-email-christian@paral.in>
 <1464219082-3818-2-git-send-email-christian@paral.in>
 <20160526211207.06e27be6@free-electrons.com>
 <1464294094194-a799811f-1fe2864f-ad38cf3d@mixmax.com>
Message-ID: <20160527072332.615bee85@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 May 2016 20:21:34 +0000, Christian Stewart wrote:

> > Why is this thing needed? I see you use it below, but it seems weird.  
> In the build scripts they use git commands to grab the commit ID. I replaced
> this in this series with a hardcoded git commit reference since we're not using
> git to fetch the source tree anymore, instead we're using tarballs. But
> including the commit hash the code originated from allows checking the revision
> properly down the line.
> This value is included in version outputs on the actual device - i.e. ?runc -v?

Then why not use the <pkg>_VERSION variable directly, like:

    -X main.gitCommit=$(RUNC_VERSION)

> > I guess you should use HOST_GO_TARGET_ENV, as in http://patchwork.ozlabs.org/patch/626824/ .  
> I looked at that and it didn't seem quite right, and that's liable to change
> down the line, so I copied it here. Keeping the envs package specific seems to
> me the most reliable solution.

I'm sorry, I don't understand what you mean here. The go package
conveniently provides a variable for packages to use, to avoid mistakes
and duplications in packages. When such a variable exists, it should
definitely be used, and packages should not duplicate similar
information, as it's a big maintenance burden down the line.

But when I look at your v3, I see that you are now using
HOST_GO_TARGET_ENV. So I really don't understand what you said here.

> > What is the export doing here?  
> Setting up GOPATH and GOBIN, this is also why I use the && on the next lines,
> otherwise we would have to write the env statement for all of those lines.
> The purpose of those commands is to place the ?runc? sources at the proper
> location within the gopath tree. Go requires a tree to locate code. So inside
> runc, assuming there's ?pkg/foo?, the path would be
> ?github.com/opencontainers/runc/pkg/foo?. The GOPATH filesystem tree must match
> this.
> To fix this problem, we build a ?vendor? tree with dependencies, and then
> simlink ?runc? into the proper location within that tree. This allows Go to
> resolve everything properly.
> The same applies to the other patches in this series.
> I will fix the formatting issues and other things mentioned above and respin in
> a couple of days.

OK, thanks for the explanation. I see you fixed the export as well,
which is good.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
