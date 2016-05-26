From: Christian Stewart <christian@paral.in>
Date: Thu, 26 May 2016 20:21:34 +0000
Subject: [Buildroot] [PATCH v3 1/3] runc: new package
In-Reply-To: <20160526211207.06e27be6@free-electrons.com>
References: <1464219082-3818-1-git-send-email-christian@paral.in>
 <1464219082-3818-2-git-send-email-christian@paral.in>
 <20160526211207.06e27be6@free-electrons.com>
Message-ID: <1464294094194-a799811f-1fe2864f-ad38cf3d@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
On Thu, May 26, 2016 at 12:12 PM Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> It seems like it uses cgo, so you need a dependency on
BR2_TOOLCHAIN_HAS_THREADS here + the corresponding Config.in comment.
Noted, will fix for the next revision.
> Why is this thing needed? I see you use it below, but it seems weird.
In the build scripts they use git commands to grab the commit ID. I replaced
this in this series with a hardcoded git commit reference since we're not using
git to fetch the source tree anymore, instead we're using tarballs. But
including the commit hash the code originated from allows checking the revision
properly down the line.
This value is included in version outputs on the actual device - i.e. ?runc -v?
> Indentation for the help text is one tab + two spaces.
Will fix.
> I guess you should use HOST_GO_TARGET_ENV, as in http://patchwork.ozlabs.org/patch/626824/ .
I looked at that and it didn't seem quite right, and that's liable to change
down the line, so I copied it here. Keeping the envs package specific seems to
me the most reliable solution.
> What is the export doing here?
Setting up GOPATH and GOBIN, this is also why I use the && on the next lines,
otherwise we would have to write the env statement for all of those lines.
The purpose of those commands is to place the ?runc? sources at the proper
location within the gopath tree. Go requires a tree to locate code. So inside
runc, assuming there's ?pkg/foo?, the path would be
?github.com/opencontainers/runc/pkg/foo?. The GOPATH filesystem tree must match
this.
To fix this problem, we build a ?vendor? tree with dependencies, and then
simlink ?runc? into the proper location within that tree. This allows Go to
resolve everything properly.
The same applies to the other patches in this series.
I will fix the formatting issues and other things mentioned above and respin in
a couple of days.
Best, Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160526/71929d97/attachment.html>
