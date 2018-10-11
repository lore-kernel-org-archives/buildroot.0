From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 11 Oct 2018 07:43:32 +0300
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <20181010174814.5ac114f1@windsurf>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
Message-ID: <87y3b5ks97.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thomas Petazzoni writes:
>>          arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/e5ff4589243ce1f11248b5f9fab3cca614a48b11 | ORPH
>
> (cd src && make - --no-print-directory - --jobserver-fds=6,7 -j)
> make: unrecognized option '--jobserver-fds=6,7'
>
> This suddenly started happening on September 9, 2018. We have not
> bumped boa. I'm not sure what caused this. It fails on different
> autobuilder machines. Boa is calling submake with $(MFLAGS), which is
> probably the issue, but why did this suddenly started to happen ?
>
> With a minimal configuration with just Boa, I cannot reproduce on my
> machine here, neither on my autobuilder where the problem is reported
> to occur.

I guess it is related to commit 05167a9ffa (package/make: add host
variant) which was applied on September 8, 23:36. Build seems to fail
only on hosts with make older than 4.0, so the host-make build is
triggered.

>>      powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/e679ef90219c5e8f9c94ddcd7d3f9582f79ef751 | ORPH
>
> ../../src/StatHist.h:112:30: error: invalid pure specifier (only '= 0' is allowed) before ';' token
> ../../src/StatHist.h:113:31: error: invalid pure specifier (only '= 0' is allowed) before ';' token
>
> Not sure. Baruch, you recently bumped the squid package, could you have
> a look ?

This failure is from before my patch bumping squid to 4.3 (commit
419c47a2135). But I believe we'll see the same failure with 4.3.

The build only fails with the CT-NG PowerPC e500 toolchain. Is that the
only gcc 4.7 toolchain?

This is the failing code:

typedef double hbase_f(double);

class StatHist
{
    ...
    hbase_f *val_in = nullptr;        /* e.g., log() for log-based histogram */
    hbase_f *val_out = nullptr;       /* e.g., exp() for log based histogram */
}

For some reason this version of gcc considers val_in/val_out as
methods. But "fixing" the problem by changing the assignment to '= 0'
makes gcc segfault, not even ICE. So I think this is a compiler
bug. Should squid depend on gcc >= 4.8?

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
