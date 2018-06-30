From: Stefan Becker <chemobejk@gmail.com>
Date: Sat, 30 Jun 2018 19:03:17 +0300
Subject: [Buildroot] [PATCHv2] core/sdk: generate the SDK tarball
 ourselves
In-Reply-To: <20180630135645.2956-1-yann.morin.1998@free.fr>
References: <20180630135645.2956-1-yann.morin.1998@free.fr>
Message-ID: <CAOJ2eMf9iAP4kgqPWv2HwD0hBvzeWD7H7xONh0dZtDO1FoY=MQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

On Sat, Jun 30, 2018 at 4:56 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> This is pretty confusing, because taken literally, this would amount to
> running a command like:
>
>     tar cf my-sdk.tar -C output/host/ .
>
> This creates a tarbomb [0], which is very bad practice, because when
> extracted, it creates multiple files in the current directory.
> ...
> So, we fix that mess by giving the top-most directory a recognisable
> name, based on the target tuple and the Buildroot version, which we also
> use as the name of the archive (suffixed with the usual +.tar.gz+.)

Sorry, but I can neither follow nor agree with this logic. The above
tar command line is IMHO *exactly* how the SDK tarball should be
generated, because it leaves the choice up to the user of the tarball
*how* to use/integrate it downstream.

Anything else, especially directory names that change with every
build, only creates unnecessary hoops the user of the SDK has to jump
through every time.

> We offer the user the possibility to override that default by specifying
> the +BR2_SDK_PREFIX+ variable on the command line.

Does "export BR2_SDK_PREFIX=" make sure that no prefix is used, i.e.
you get the same output as the tar command above? If the answer is YES
then this should be mentioned in the manual.

Does "export BR2_SDK_PREFIX=" disable the variable part of the tarball
name? Judging from the diffs the answer is likely NO, i.e. you can't
disable the version part of the tarball name.

> We choose to make the existing rule to generate the tarball, and
> introduce a new rule to just prepare the SDK, rather than keep the
> existing rule as-is and introduce a new one to generate the tarball,
> because it makes sense to have the simplest rule do the correct thing,
> leaving advanced, power users use the longest command.

I'm not really happy with this, but at least I now have the choice and
just need to update one line in the build script to disable all this
useless stuff.

> If someone
> already had a wrapper that called 'sdk' and expected just the host
> directory to be prepared, then this is not broken; it just takes a bit
> longer (gzip is pretty fast).

I would be careful with such statements. Based on my experience with
our automated build system generating the tarballs from output/target
& output/host takes a non-trivial amount of the total build time.

Regards, Stefan
