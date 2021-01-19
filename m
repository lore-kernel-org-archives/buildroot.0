From: Christian Stewart <christian@paral.in>
Date: Mon, 18 Jan 2021 19:52:30 -0800
Subject: [Buildroot] Buildroot on Windows Subsystem for Linux (WSL)
In-Reply-To: <878s8qf1cm.fsf@dell.be.48ers.dk>
References: <87h7njrilt.fsf@paral.in> <878s8qf1cm.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2oGKpEX8fwJw6SHHbQnV7uvcZkArz3X8m_5Sk39U5PbLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Jan 18, 2021 at 12:15 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
>  > The Buildroot system works as expected in the WSL environment. The
>  > buildroot output tar.gz can be imported directly into WSL 2.0. WSL 1.0
>  > requires using the WSL-DistroLauncher project to load the distribution
>  > via a Windows Appx.
>
>  > This is an interesting way to use Buildroot under Windows.
>
> Cute. Besides the fact that you are booting a (heavily patched) Linux
> kernel, is there any specific advantages to just creating a docker
> container or a classic VM from a Buildroot build?

By my (limited) understanding, WSL2 promises tighter integration
between Linux and the Windows OS.

I haven't tested it, but docs say you can override the kernel image.

It forces a wsl-provided /init binary, which forks several times to
consume PID 1, 2, 3.

https://github.com/microsoft/WSL2-Linux-Kernel/issues/30#issuecomment-698922943

According to this, Windows 10 insider builds 20201 or above, you can
add a custom init process:

Adding to /etc/wsl.conf inside the VM:

[boot]
command = "/my-init"

However, the my-init binary will not run as PID 1.

I am working on a workaround similar to the "systemd-genie" project to
create a PID namespace and run systemd as PID 1 inside that.

Best regards,
Christian Stewart
