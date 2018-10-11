From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Oct 2018 11:48:22 +0200
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <20181011085357.191cfccb@windsurf> (Thomas Petazzoni's message of
 "Thu, 11 Oct 2018 08:53:57 +0200")
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf> <87y3b5ks97.fsf@tkos.co.il>
 <20181011085357.191cfccb@windsurf>
Message-ID: <87efcwstjt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Thu, 11 Oct 2018 07:43:32 +0300, Baruch Siach wrote:
 >> Thomas Petazzoni writes:
 >> >> arm | boa-0.94.14rc21 | NOK |
 >> > http://autobuild.buildroot.net/results/e5ff4589243ce1f11248b5f9fab3cca614a48b11
 >> > | ORPH
 >> >
 >> > (cd src && make - --no-print-directory - --jobserver-fds=6,7 -j)
 >> > make: unrecognized option '--jobserver-fds=6,7'
 >> >
 >> > This suddenly started happening on September 9, 2018. We have not
 >> > bumped boa. I'm not sure what caused this. It fails on different
 >> > autobuilder machines. Boa is calling submake with $(MFLAGS), which is
 >> > probably the issue, but why did this suddenly started to happen ?
 >> >
 >> > With a minimal configuration with just Boa, I cannot reproduce on my
 >> > machine here, neither on my autobuilder where the problem is reported
 >> > to occur.  
 >> 
 >> I guess it is related to commit 05167a9ffa (package/make: add host
 >> variant) which was applied on September 8, 23:36. Build seems to fail
 >> only on hosts with make older than 4.0, so the host-make build is
 >> triggered.

 > Yes, I figured that out after sending my summary. I reproduced the
 > issue on my build server, which has an old make installed system-wide,
 > and this issue seems to appear only when host-make is built prior to
 > boa. There's a mixup of make being used, with a new "make" used at the
 > top-level, passing options unknown to the old "make" used at the
 > lower-level.

Ahh, yes. It looks to be the other way around though:

usr/bin/make -j6  -C /home/peko/autobuild/instance-0/output/build/boa-0.94.14rc21/
make[1]: Entering directory `/home/peko/autobuild/instance-0/output/build/boa-0.94.14rc21'
(cd src && make -w --jobserver-fds=5,6 -j)
make: unrecognized option '--jobserver-fds=5,6'

So the issue is that we expand the path to make on the host in
package/Makefile.in:HOSTMAKE but then host-make installs make into the
path and build systems just calling make instead of looking at the MAKE
variable (which boa does because of its gnumake check) ends up with
host-make rather than the system one.

A quick fix would be to set BOA_MAKE to $(BR2_MAKE), but that is a bit
of a hack.

-- 
Bye, Peter Korsgaard
