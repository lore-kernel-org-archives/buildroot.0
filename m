From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 27 Jun 2014 08:23:47 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-06-25
In-Reply-To: <CAMo8BfJ=k-LZcFoszurWz=9=PSvPV84O6VRKu0-bQ4J3iXO8Cw@mail.gmail.com>
References: <20140626063011.68A1B1011DF@stock.ovh.net>
 <20140626063519.GQ4155@tarshish>
 <CAMo8BfKzjF4CsbgZZKw_orUOBkTNLKTS2q__OeSu7fugNr1zPg@mail.gmail.com>
 <CAMo8BfKdyq=Sw84=Z=yZL4fjVDzpvLWMf=E22od=5cUDs9396g@mail.gmail.com>
 <CAAXf6LXGNsjsH8pUNtAckzTuCGsGQJMkre3h+sQAN1Gd-cVqHA@mail.gmail.com>
 <CAMo8BfJ=k-LZcFoszurWz=9=PSvPV84O6VRKu0-bQ4J3iXO8Cw@mail.gmail.com>
Message-ID: <CAAXf6LXY61QBGGHx5EsyOhLgFB=9ER_X29pZTm8w6+DZ7rgP7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

On Thu, Jun 26, 2014 at 10:42 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
[..]
>>
>> I think it is debatable whether output to /dev/null in gcc is legal or not.
>> My personal feeling is that this should work, and that if xtensa
>> cannot deal with it then they should buffer internally and write out
>> the file as the last step.
>
> It just doesn't seem practical to fix in ld what can be fixed (and actually
> once was fixed) in the configure script. AFAIU the configure script should
> be as conservative as possible, so e.g. autoconf-generated scripts don't
> use such trick.

From a buildroot-practical point of view it's indeed more easy to fix dhcpcd.

>
>> Note that we are using the same /dev/null trick in the check-arm-abi code.
>
> Haven't found that, can you point me to a specific file?

See toolchain/helpers.mk, function check_arm_abi:

check_arm_abi = \
    __CROSS_CC=$(strip $1) ; \
    __CROSS_READELF=$(strip $2) ; \
    EXT_TOOLCHAIN_TARGET=`LANG=C $${__CROSS_CC} -v 2>&1 | grep ^Target
| cut -f2 -d ' '` ; \
    if ! echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
        echo "External toolchain uses the unsuported OABI" ; \
        exit 1 ; \
    fi ; \
    if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o /dev/null -
2>/dev/null; then \
        abistr_$(BR2_ARM_EABI)='EABI'; \
        abistr_$(BR2_ARM_EABIHF)='EABIhf'; \
        echo "Incorrect ABI setting: $${abistr_y} selected, but
toolchain is incompatible"; \
        exit 1 ; \
    fi


Best regards,
Thomas
