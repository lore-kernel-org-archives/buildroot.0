From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 16:12:10 +0200
Subject: [Buildroot] [PATCH] qt5webkit: fix building in Python 3
 environment
In-Reply-To: <CAGm1_kuirawLGrFj3hTAOAn46Uj8+F6UVuB-m_Kxb65HO3zRmQ@mail.gmail.com>
References: <1476451574-31822-1-git-send-email-yegorslists@googlemail.com>
 <20161014154013.231da448@free-electrons.com>
 <CAGm1_kuirawLGrFj3hTAOAn46Uj8+F6UVuB-m_Kxb65HO3zRmQ@mail.gmail.com>
Message-ID: <2742504b-33f2-0fcc-cc7a-8297e563bc6b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-10-16 15:59, Yegor Yefremov wrote:
> On Fri, Oct 14, 2016 at 3:40 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
[snip]
>> So if we apply your patch, I believe we will fall again into the
>> autobuilder issues that commit ac16793eaaabfced0312420759e3a66cdaa1ea8e
>> was fixing.
>>
>> Can you explain why your patch is needed, and what now makes qt5webkit
>> build fine with Python 3 on the host ?
> 
> First of commit "package/qt5webkit: needs host-python" just adds
> host-python dependency, that wasn't there before. As I've described
> here [1], this approach breaks user space python, as the symlink
> points to host binary. Then I greped in qt5webkit source folder and
> found some hints about Python 3 fixes. Upstream qt5webkit
> (http://code.qt.io/cgit/qt/qtwebkit.git) has following commits:
> 
> 18cb1a3ae907d76da9eb8c54528cf3bcb074d0e5 (Fix build failure with python3)
> 95ae190ff329824019621b860cdfd048eeebe48d (Failure building with python3)
> 
> Then I've removed output/build/host-python directory and
> output/build/qt5webkit and rebuilt this package having only
> host-python3. I could succeesfully make this.

 So, can you re-analyse the original autobuild failures and find out why they
happened?

http://autobuild.buildroot.org/results/ea4/ea4dd00ee585f9f9ea1927b8b5fd9035e6733420/
http://autobuild.buildroot.org/results/323/323ba220fae70d94c81bab9a348be844e90ace91/
http://autobuild.buildroot.org/results/6c2/6c20c9e222f94e6b70b97b87e1393dd16da2718c/

 Nothing has changed in qt5webkit since those autobuild failures, so simply
reverting ac16793eaaabfc is going to re-introduce those failures.

 Regards,
 Arnout

> [1] http://lists.busybox.net/pipermail/buildroot/2016-October/174215.html
> 
> Yegor
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
