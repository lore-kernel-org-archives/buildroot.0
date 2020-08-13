From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Thu, 13 Aug 2020 20:28:24 +0200
Subject: [Buildroot] Package for .NET Core runtime
Message-ID: <CAOiXNkB1uAiKUczr42uOtXQLR1ZujhhWOCyADfaUQqzVEcAH_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks,

There was a need for me to integrate .NET Core runtime in our
Buildroot-based build process. Since there is no corresponding package
available, I created the new one and am happy to share it (in
attachment).

Lack of deep knowledge of Buildroot and time pressure prevents me from
creating it as general as I would like it to be. Nevertheless, I think
it could be useful for some developers (at least as a starting point).

The following are some points which might be improved.

1. I made the package explicitly depending on glibc. However, as I
understand from reading installation script provided by Microsoft
(https://dotnet.microsoft.com/download/dotnet-core/scripts),
musl-based systems are also supported. There are also couple of
additional dependencies I derived from this script and put them
explicitly into Config.in . So they must be satisfied before the
package will appear in menuconfig.

2. This package installs 32 bit ARM version regardless of the target
system selected. Microsoft also provides versions for 64 bit ARM and
x86/64 . It was sufficient for our concrete target using it as a
package in an external tree. It would be probably a blocking issue for
including the package as is in Buildroot. I do not know yet how to
handle this issue. Maybe someone more knowledgeable as I am can
improve it.

3. There are several options how to tell the .net core executables
where the runtime is located. Please read the comment in
dotnet-runtime.mk for more details. Maybe these options could be made
available for the user via menuconfig somehow.

Anyway, it works with Buildroot 2020.05.01 for 32-bit ARM (tested with
STM32MP157C-DK2 board).

Just as an information - to get an advantage of the shared runtime,
executables should be generated as NOT self-contained (otherwise, the
whole runtime will be duplicated). It could be done with the following
command:
$ dotnet publish -c Release -r linux-arm --self-contained false

Hope it will be useful for someone and can save some time for fellow developers.

Regards,
Andrey.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dotnet-runtime-pkg.tgz
Type: application/x-compressed-tar
Size: 1023 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200813/df90c383/attachment.bin>
