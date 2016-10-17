From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 17 Oct 2016 12:29:48 +0200
Subject: [Buildroot] [PATCH] qt5webkit: fix building in Python 3
	environment
In-Reply-To: <2742504b-33f2-0fcc-cc7a-8297e563bc6b@mind.be>
References: <1476451574-31822-1-git-send-email-yegorslists@googlemail.com>
 <20161014154013.231da448@free-electrons.com>
 <CAGm1_kuirawLGrFj3hTAOAn46Uj8+F6UVuB-m_Kxb65HO3zRmQ@mail.gmail.com>
 <2742504b-33f2-0fcc-cc7a-8297e563bc6b@mind.be>
Message-ID: <CAGm1_kuE3c=-pbGwGiXU+r-PUikz3oUG4d8COzHBTVoacWyQRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 14, 2016 at 4:12 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 14-10-16 15:59, Yegor Yefremov wrote:
>> On Fri, Oct 14, 2016 at 3:40 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Hello,
>>>
> [snip]
>>> So if we apply your patch, I believe we will fall again into the
>>> autobuilder issues that commit ac16793eaaabfced0312420759e3a66cdaa1ea8e
>>> was fixing.
>>>
>>> Can you explain why your patch is needed, and what now makes qt5webkit
>>> build fine with Python 3 on the host ?
>>
>> First of commit "package/qt5webkit: needs host-python" just adds
>> host-python dependency, that wasn't there before. As I've described
>> here [1], this approach breaks user space python, as the symlink
>> points to host binary. Then I greped in qt5webkit source folder and
>> found some hints about Python 3 fixes. Upstream qt5webkit
>> (http://code.qt.io/cgit/qt/qtwebkit.git) has following commits:
>>
>> 18cb1a3ae907d76da9eb8c54528cf3bcb074d0e5 (Fix build failure with python3)
>> 95ae190ff329824019621b860cdfd048eeebe48d (Failure building with python3)
>>
>> Then I've removed output/build/host-python directory and
>> output/build/qt5webkit and rebuilt this package having only
>> host-python3. I could succeesfully make this.
>
>  So, can you re-analyse the original autobuild failures and find out why they
> happened?
>
> http://autobuild.buildroot.org/results/ea4/ea4dd00ee585f9f9ea1927b8b5fd9035e6733420/
> http://autobuild.buildroot.org/results/323/323ba220fae70d94c81bab9a348be844e90ace91/
> http://autobuild.buildroot.org/results/6c2/6c20c9e222f94e6b70b97b87e1393dd16da2718c/
>
>  Nothing has changed in qt5webkit since those autobuild failures, so simply
> reverting ac16793eaaabfc is going to re-introduce those failures.

I've reverted the patch with python 2 workaround, changed all
occurrences of python in qt5webkit build files to python3 and compiled
the stuff again, but it
doesn't fail. My build system has following Python versions:

Python 2.7.9
Python 3.4.2

It would be interesting to know, what python versions were on this
particular build machine, that caused build failures. Where can I get
such information?

Yegor
