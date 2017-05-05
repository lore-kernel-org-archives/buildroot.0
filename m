From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 5 May 2017 17:11:08 -0500
Subject: [Buildroot] Analysis of build results for 2017-05-04
In-Reply-To: <20170505132423.3602e294@free-electrons.com>
References: <20170505062802.8C0262097E@mail.free-electrons.com>
 <20170505132423.3602e294@free-electrons.com>
Message-ID: <CANQCQpYL-sL2xGKw==LAgEOSnoD_ULAaCtj=cb-KAFyM0ZJt4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, May 5, 2017 at 6:24 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Usual analysis of build results. Matt, Waldemar, Mario, Adam, Semyon,
> Vicente, Bernd, Martin, Arnout, Peter, there are some issues/questions
> for you below. Thanks!
>
> On Fri,  5 May 2017 08:28:02 +0200 (CEST), Thomas Petazzoni wrote:
>
>>          arm |              apache-legal-info | NOK | http://autobuild.buildroot.net/results/2564362d01139ca3bf3caa30509ae1c8c21239ef |
>
> This one looks really weird. The build was successful, but the
> legal-info at the end of the build failed, because the Apache httpd
> tarball has disappeared from the download folder. I don't really see
> how this could be happening.
>
> Matt, since this issue occurred on your autobuilder slave, could you
> indicate if you have done some maintenance / manually removed some
> downloaded files ?

Let me check, I have 4 autobuilders setup to share the same archive folder.

<snip>

>>          arm |          host-ti-cgt-pru-2.1.4 | NOK | http://autobuild.buildroot.net/results/01fccc880ae53a60e03eb1bf8236d5c02c28dada |
>
> chmod +x /accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/dl/ti_cgt_pru_2.1.4_linux_installer_x86.bin
> chmod: changing permissions of '/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-1/dl/ti_cgt_pru_2.1.4_linux_installer_x86.bin': Operation not permitted
>
> Matthew: this is a configuration issue on your autobuilder slave. It is
> not normal that we are not allowed to set execution permissions. Could
> you fix this?

Yep, I'll resolve this tonight.  Similar issue to above, I'm using a
cached folder for my builds and the autobuilder.  I''ll fix the
permissions and separate the dl folders from being shared.

>
>>       x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/68c2fb80a57ed5a7b5ba2cddd91aaf7afcc3476b |
>
> This has been broken for too long on x86-64, I'll disable it.
>
>>          arm |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/f92c7cbb26ee25ba709a2a6b0738189b835d4322 | ORPH
>>       mipsel |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/b7ded5f81093790ea528738bc3734503576d1cb2 | ORPH
>>        nios2 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/02b3f6bcb2743f529204160e5f1af95a7cf0ba51 | ORPH
>>          arm |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/8ca091e02cdbcea1541e8c3d58372cec17705ade | ORPH
>>       x86_64 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/c18967f936310680ed91e8dac6476a026d92dddc | ORPH
>>       x86_64 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/f6e7a44a56270ebd869ac1e7f78b563c908c7b70 | ORPH
>>       mipsel |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/4f0eb2af09c92ff4cd7448211ffda432754d4e60 | ORPH
>
> Fixed by
> https://git.buildroot.org/buildroot/commit/?id=4d11848a21d4424a04e8428c4cd3bd5e972aacdf.
>
> Who wants to be in the DEVELOPERS file for this package ?

I'll take it.  Want me to submit a patch?

>
>>     mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/98df2219b99c74f63d214dee5feb77925932f17d |
>
> Python/SWIG issue in SELinux.
>
> Matthew? Adam?

Ah fun, will take a look,  I'm starting to not like SWIG :-)

<snip>

>
>>       x86_64 | toolchain-external-custom-l... | NOK | http://autobuild.buildroot.net/results/5890a96c4f8324839981ce950241b1c442e80827 | ORPH
>
> This is another instance of legal-info failing on Matthew autobuilder
> instance, because the tarball has disappeared.
>
> Matthew, are you doing something funky like sharing the download
> folders between the different instances ?

Yes, I will separate them out.

-Matt
