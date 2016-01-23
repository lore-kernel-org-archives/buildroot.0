From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 22 Jan 2016 20:05:01 -0500
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CA+-urNSaEmBp=wsP_kjzk=63T3xt+9wBY-yLJzsXagi5QH2iQQ@mail.gmail.com>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
 <CA+-urNTGae35+MuvCzE3UE0POL0NJxfGRciXaZf8ohDdq_a-RQ@mail.gmail.com>
 <20160117122340.3b07b5ed@free-electrons.com>
 <CA+-urNSaEmBp=wsP_kjzk=63T3xt+9wBY-yLJzsXagi5QH2iQQ@mail.gmail.com>
Message-ID: <CA+-urNRYkOOe4TCxiUeLYLqQS-1+8qCVP9qMiEthTsi22Q61NQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and Johan,

On Sun, Jan 17, 2016 at 11:33 AM, Frank Hunleth
<fhunleth@troodon-software.com> wrote:
> Hi Thomas,
>
> On Sun, Jan 17, 2016 at 6:23 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Sat, 16 Jan 2016 20:42:55 -0500, Frank Hunleth wrote:
>>
>>> > Frank, can you investigate why it builds on x86_64 but not on aarch64 ?
>>>
>>> I looked into this a little. My suspicion is that the atomic intrinsic
>>> macros in the Erlang code have not been ported to aarch64, but I'm
>>> having trouble following the code. I've inquired on the Erlang mailing
>>> list and will report back.
>
> It turns out that other people have gotten Erlang to work on aarch64
> without libatomic_ops installed. That doesn't work for Buildroot since
> other programs could depend on libatomic_ops. I've filed a bug against
> Erlang to track this at http://bugs.erlang.org/browse/ERL-78.
> Specifying '--disable-native-ethr-impls' to ./configure seems to
> workaround the issue, but I don't know if it has other consequences.
> Hopefully the Erlang maintainers will get to this sooner rather than
> later, but they're a pretty busy group.

I received further advice from the Erlang mailing list. The summary is:

   1. Upgrade to Erlang 18 (BR is currently using 17.5)
   2. Prefer the use of Erlang 18's native atomics implementation over
libatomic_ops.

I verified that upgrading to Erlang 18 and not using libatomic_ops
works for all qemu_*_defconfigs (with Erlang enabled), the aarch64
autobuilder failure, and a couple other configs. It does not work with
sparc_v8 as recently found with Erlang 17.5. I also tested whether
Erlang 18's configure scripts would choose libatomic_ops if it were
present, and they do not. This was tedious, so I am quite open to
others repeating the tests (or telling me to do so) if this does not
sound right. As a result of this testing, I disabled the use of
libatomic_ops for Erlang as you will see in a subsequent patch set.

Unfortunately, the upgrade to Erlang 18 was nontrivial due to a couple
major changes to the language and APIs. I had to bump the versions of
ejabberd and nearly all Erlang packages to fix this. While Erlang is
very important to me, I have never used the rebar infrastructure or
ejabberd. I verified that the new version of ejabberd compiles across
all qemu_*_defconfigs except the sparc_v8 one. I do not know if it
runs correctly, though. Johan - I cc'd you since I saw that you are
using ejabberd. Hopefully you can review too.

The patch set will follow shortly.

Frank
