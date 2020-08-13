From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 21:28:33 +0200
Subject: [Buildroot] Package for .NET Core runtime
In-Reply-To: <CAOiXNkB1uAiKUczr42uOtXQLR1ZujhhWOCyADfaUQqzVEcAH_w@mail.gmail.com>
References: <CAOiXNkB1uAiKUczr42uOtXQLR1ZujhhWOCyADfaUQqzVEcAH_w@mail.gmail.com>
Message-ID: <20200813212833.3a8f4005@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andrey,

On Thu, 13 Aug 2020 20:28:24 +0200
Andrey Nechypurenko <andreynech@gmail.com> wrote:

> There was a need for me to integrate .NET Core runtime in our
> Buildroot-based build process. Since there is no corresponding package
> available, I created the new one and am happy to share it (in
> attachment).
> 
> Lack of deep knowledge of Buildroot and time pressure prevents me from
> creating it as general as I would like it to be. Nevertheless, I think
> it could be useful for some developers (at least as a starting point).
> 
> The following are some points which might be improved.
> 
> 1. I made the package explicitly depending on glibc. However, as I
> understand from reading installation script provided by Microsoft
> (https://dotnet.microsoft.com/download/dotnet-core/scripts),
> musl-based systems are also supported. There are also couple of
> additional dependencies I derived from this script and put them
> explicitly into Config.in . So they must be satisfied before the
> package will appear in menuconfig.
> 
> 2. This package installs 32 bit ARM version regardless of the target
> system selected. Microsoft also provides versions for 64 bit ARM and
> x86/64 . It was sufficient for our concrete target using it as a
> package in an external tree. It would be probably a blocking issue for
> including the package as is in Buildroot. I do not know yet how to
> handle this issue. Maybe someone more knowledgeable as I am can
> improve it.
> 
> 3. There are several options how to tell the .net core executables
> where the runtime is located. Please read the comment in
> dotnet-runtime.mk for more details. Maybe these options could be made
> available for the user via menuconfig somehow.
> 
> Anyway, it works with Buildroot 2020.05.01 for 32-bit ARM (tested with
> STM32MP157C-DK2 board).
> 
> Just as an information - to get an advantage of the shared runtime,
> executables should be generated as NOT self-contained (otherwise, the
> whole runtime will be duplicated). It could be done with the following
> command:
> $ dotnet publish -c Release -r linux-arm --self-contained false

Thanks for the contribution and the details? The package doesn't seem
to be that complicated. Do you think you could take the time to address
the few issues you've pointed out, and submit it as a proper patch for
inclusion ?

In any case, could you give some details on how this .NET Core runtime
is meant to be used ? For example, would I need to take the SDK for
x86-64 from https://dotnet.microsoft.com/download/dotnet-core/3.1,
build a program with it, place the binary on the target, where it can
run thanks to the .NET Core runtime you have packaged ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
