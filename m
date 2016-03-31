From: Matthew Weber <matt@thewebers.ws>
Date: Wed, 30 Mar 2016 20:24:49 -0500
Subject: [Buildroot] [PATCH 1/1] buildroot-test: enable toolchains based
 on hostarch
In-Reply-To: <CAFt09wMJ7KssVQczosB9PfhX5m2Ez8HrLH9NM22QiFsUgyByxQ@mail.gmail.com>
References: <1459302445-1256-1-git-send-email-matt@thewebers.ws>
 <20160330165525.4378cef8@free-electrons.com>
 <CAFt09wOZO-VodhttV3qsc5s_z0D7JzGij6ShPxYz1F0iyv-uMg@mail.gmail.com>
 <20160331030047.339bd480@free-electrons.com>
 <CAFt09wMJ7KssVQczosB9PfhX5m2Ez8HrLH9NM22QiFsUgyByxQ@mail.gmail.com>
Message-ID: <CAFt09wPAQQBFHUq+EMZr1S3Ap6TeJ3vKyZg6nZayRuQLPyD8fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Mar 30, 2016 at 8:11 PM, Matthew Weber <matt@thewebers.ws> wrote:
> Thomas,
>
> On Wed, Mar 30, 2016 at 8:00 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Wed, 30 Mar 2016 19:41:00 -0500, Matthew Weber wrote:
>>
>>> I guess I don't completely follow why "any arch" for the internals, as
>>> that host arch entry should represent the arch of the system the
>>> toolchain was built on, correct?  Or are you saying that because an
>>> internal normally would be built from scratch it would work on any
>>> arch?
>>
>> Precisely: internal toolchain configurations are configurations where
>> the toolchain is built by Buildroot. Since it's built from scratch, the
>> architecture of the machine on which we're running the build doesn't
>> matter.
>
> But for the autobuilder....  wondering how to distinguish host arch
> then for internals...
>
>>
>>> If so, maybe we need a test that checks the gcc executable for
>>> arch rather then using this host arch entry?
>>
>> The problem is that we need to know *before* choosing the toolchain
>> configuration whether it will work or not on your machine. Otherwise,
>> you'll pick up one of the toolchain configuration, generate a random
>> set of packages, and then start the build. The build will start by
>> downloading the external toolchain, will attempt to run the external
>> toolchain gcc, which will fail and abort the build. Of course, at this
>> point, we could detect if the failure is caused by the gcc not being
>> for the right architecture, and instead of categorizing this failure as
>> a build failure, simply move on and generate another configuration. But:
>>
>>  1/ This seems really wasteful.
>
> Agreed
>
>>
>>  2/ It is not that trivial to distinguish build failures caused by the
>>     compiler not being built for the right architecture from other
>>     failures.
>>
>>> I do have a bug as we would still want to allow the i386 toolchains to
>>> execute on a x86_64 system.  Currently it excludes those with this
>>> update.
>>
>> Correct. i386 toolchains should be considered for x86_64 systems.
>
> I'm thinking something like this in the get_toolchain _configs() that
> adds the conditional to allow that.
> ...
>     (_, _, _, _, hostarch) = os.uname()
>     # ~2015 distros report x86 when on a 32bit install
>     if hostarch == 'i686' or hostarch == 'i386' or hostarch == 'x86':
>         hostarch = 'x86'
>     # x86_64 defaults correctly, so not setting
>
>     for row in csv.reader(l):
>         config = {}
>         config["url"] = row[0]
>         config["hostarch"] = row[1]
>         # Ignore toolchains that are not built for the appropriate
>         # host architecture
>         if hostarch != 'x86_64' and hostarch != config["hostarch"]:
>             continue
>         # Assuming x86_64 can also execute x86 toolchains
>         if hostarch == 'x86_64' and config["hostarch"] != 'x86':
>             continue
>         config["libc"] = row[2]
>         with urlopen_closing(config["url"]) as r:
>             config["contents"] = decode_byte_list(r.readlines())
>         configs.append(config)
>     return configs
>

Updated to account for 'any' host arch.

    # ~2015 distros report x86 when on a 32bit install
    if hostarch == 'i686' or hostarch == 'i386' or hostarch == 'x86':
        hostarch = 'x86'

    for row in csv.reader(l):
        config = {}
        config["url"] = row[0]
        config["hostarch"] = row[1]
        # Ignore toolchains that are not built for the appropriate
        # host architecture
        if hostarch != 'x86_64' and hostarch != config["hostarch"] and
config["hostarch"] != 'any' :
            continue
        # Assuming x86_64 can also execute x86 toolchains
        if hostarch == 'x86_64' and config["hostarch"] != 'x86' and
config["hostarch"] != 'any':
            continue
        config["libc"] = row[2]
        with urlopen_closing(config["url"]) as r:
            config["contents"] = decode_byte_list(r.readlines())
        configs.append(config)
    return configs

>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>
>
>
> --
> Thanks,
> Matt



-- 
Thanks,
Matt
