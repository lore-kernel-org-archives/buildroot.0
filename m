From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 2 Jan 2015 22:34:48 +0100
Subject: [Buildroot] [PATCH v2 2/2] Makefile: pass host PKG_CONFIG_PATH
 at "make menuconfig" time
In-Reply-To: <CAEYzJUGqVDVv5Khyr_=BGhfWSxvhp6WO6uWfuqehPCWmSYTHpg@mail.gmail.com>
References: <1420145678-11134-1-git-send-email-bjorn.forsman@gmail.com>
 <1420145678-11134-3-git-send-email-bjorn.forsman@gmail.com>
 <20150102161603.GF4392@free.fr>
 <CAEYzJUGqVDVv5Khyr_=BGhfWSxvhp6WO6uWfuqehPCWmSYTHpg@mail.gmail.com>
Message-ID: <CAEYzJUEcE-ihJCMCWSdhC7W=8fTT2Mnb-ACSE7ha7SwAAHAECg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2 January 2015 at 22:28, Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
> Hi Yann,
>
> Thanks for the feedback. Comments below.
>
> On 2 January 2015 at 17:16, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Bj?rn, All,
>>
>> On 2015-01-01 21:54 +0100, Bj?rn Forsman spake thusly:
>>> Buildroot unexports PKG_CONFIG_PATH in the top-level Makefile for purity
>>> reasons. But it has an unfortunate side-effect in that "make menuconfig"
>>> will not (necessarily) be able to pick up ncurses via host pkg-config,
>>> breaking "make menuconfig" on systems where ncurses is installed in a
>>> non-standard location.
>>>
>>> This patch saves the original PKG_CONFIG_PATH variable in
>>> HOST_PKG_CONFIG_PATH and restores the original PKG_CONFIG_PATH variable
>>> only in the sub-processes that builds the various menuconfig/nconfig/...
>>> targets.
>>>
>>> With this change, I am able to run "make menuconfig" on NixOS[1].
>>>
>>> [1]: http://nixos.org/
>>>
>>> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
>>> ---
>>>  Makefile | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 5e0b4f2..2f1108f 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -264,6 +264,7 @@ export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
>>>  export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
>>>
>>>  # Make sure pkg-config doesn't look outside the buildroot tree
>>> +export HOST_PKG_CONFIG_PATH=$(PKG_CONFIG_PATH)
>>
>> I think you'd want to do an immediate assignment here, and not do an
>> export (see below):
>>
>>     HOST_PKG_CONFIG_PATH:=$(PKG_CONFIG_PATH)
>
> Will fix.

Some comments. There are other HOST_* variables that are exported from
the top-level Makefile. I guess that's why I used 'export' in the
first place. For now, nobody but Buildroot itself uses
HOST_PKG_CONFIG_PATH (well, when this patch gets in), but I can see a
future where pkg-config is used within Buildroot for other host
packages too. But it is of course trivial to add the "export" at any
time :-)

- Bj?rn
