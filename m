From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 14 Oct 2016 15:59:11 +0200
Subject: [Buildroot] [PATCH] qt5webkit: fix building in Python 3
	environment
In-Reply-To: <20161014154013.231da448@free-electrons.com>
References: <1476451574-31822-1-git-send-email-yegorslists@googlemail.com>
 <20161014154013.231da448@free-electrons.com>
Message-ID: <CAGm1_kuirawLGrFj3hTAOAn46Uj8+F6UVuB-m_Kxb65HO3zRmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 14, 2016 at 3:40 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 14 Oct 2016 15:26:14 +0200, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> qt5webkit requires Python for building stage and can be built with both
>> Python 2 and 3. So remove the workaround with linking python binary and
>> use Python dependency according to the selected Buildroot's Python
>> version.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> This is pretty much reverting commit
> ac16793eaaabfced0312420759e3a66cdaa1ea8e, which says that Python 3 on
> the host doesn't work to build qt5webkit.
>
> So if we apply your patch, I believe we will fall again into the
> autobuilder issues that commit ac16793eaaabfced0312420759e3a66cdaa1ea8e
> was fixing.
>
> Can you explain why your patch is needed, and what now makes qt5webkit
> build fine with Python 3 on the host ?

First of commit "package/qt5webkit: needs host-python" just adds
host-python dependency, that wasn't there before. As I've described
here [1], this approach breaks user space python, as the symlink
points to host binary. Then I greped in qt5webkit source folder and
found some hints about Python 3 fixes. Upstream qt5webkit
(http://code.qt.io/cgit/qt/qtwebkit.git) has following commits:

18cb1a3ae907d76da9eb8c54528cf3bcb074d0e5 (Fix build failure with python3)
95ae190ff329824019621b860cdfd048eeebe48d (Failure building with python3)

Then I've removed output/build/host-python directory and
output/build/qt5webkit and rebuilt this package having only
host-python3. I could succeesfully make this.

[1] http://lists.busybox.net/pipermail/buildroot/2016-October/174215.html

Yegor
