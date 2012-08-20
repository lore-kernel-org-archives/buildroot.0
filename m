From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 20 Aug 2012 09:28:34 +0200
Subject: [Buildroot] [PATCH 02/12] microperl: how to test it ?
In-Reply-To: <CAB0FRst=m5mXiF22j+hKD+tMaBMXgF4Qqc96jcKD3WDdvAOLKw@mail.gmail.com>
References: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
 <1345041514-31539-2-git-send-email-francois.perrad@gadz.org>
 <20120815180848.1e0c3d66@skate>
 <CAB0FRst=m5mXiF22j+hKD+tMaBMXgF4Qqc96jcKD3WDdvAOLKw@mail.gmail.com>
Message-ID: <CAB0FRsubDUACFMPR-fTqtw6+O80Twx_z3S432Q+28gs58KNpuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'll send a new patch serie which supercedes this one.

Fran?ois

2012/8/16 Fran?ois Perrad <francois.perrad@gadz.org>:
> rem1: microperl is not fully supported by the Perl community.
> the build in Perl 5.16 serie is broken, see
> http://www.nntp.perl.org/group/perl.perl5.porters/2012/08/msg190323.html
> people ask about its interest, see
> http://www.nntp.perl.org/group/perl.perl5.porters/2012/08/msg190422.html
>
> rem2: in this commit, I introduce a testing scheme, and I reuse it for
> perl & miniperl packages.
> I want a reproducible and documented recipe for run the
> perl/miniperl/microerl test suite.
>
> 2012/8/15 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>> Le Wed, 15 Aug 2012 16:38:24 +0200,
>> Francois Perrad <fperrad@gmail.com> a ?crit :
>>
>>> +ifdef BR2_PACKAGE_MICROPERL_INSTALL_TESTSUITE
>>> +define MICROPERL_INSTALL_TESTSUITE
>>> +     $(INSTALL) -m644 -D $(@D)/t/TEST                $(TARGET_DIR)/root/microperl/t/TEST
>>
>> Isn't this one a script that should be installed 755?
>
> Intentional. The help string in Config.in describes how to run the test suite.
>
>>
>>> +     $(INSTALL) -m644 -D $(@D)/t/harness             $(TARGET_DIR)/root/microperl/t/harness
>>> +     cp -r $(@D)/lib         $(TARGET_DIR)/root/microperl/lib
>>> +     cp -r $(@D)/t/base      $(TARGET_DIR)/root/microperl/t/base
>>> +     cp -r $(@D)/t/cmd       $(TARGET_DIR)/root/microperl/t/cmd
>>
>> Is /root/ really the right place to install this? Isn't
>> some /usr/share/perl/ or /usr/lib/perl/ a better place?
>
> On host-dev, testing in done in the build tree, so the test suite is
> never installed.
> With cross-dev, a part of the build tree must be copied on target in
> order to run test; but you do this only during porting or debugging
> the package.
> I choice the /root directory, because it is an unusual location. If
> you find these files in /root directory in a final image, you see your
> mistake.
> I do not want to pollute /usr with test suite.
> (I try the /tmp directory, but it doesn't work)
>
>>
>>> +     echo "BEGIN { chdir 't' if -d 't'; @INC = ('../lib', '.'); } 1;" > $(TARGET_DIR)/root/microperl/TestInit.pm
>>
>> I think I would prefer a TestInit.pm file added in package/microperl/
>> rather than echo'ing it here.
>
> TestInit.pm is a preamble for each test, and a 'standard' version is
> included in the Perl distribution.
> But this 'standard' version is too convoluted (for all OS, for the
> whole test suite).
> This one-liner version is enough for microperl test suite and make
> debugging more easy.
>
> I don't want a patch which will never merged in upstream.
>
> Fran?ois
>
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
