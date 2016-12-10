From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sat, 10 Dec 2016 00:09:56 -0500
Subject: [Buildroot] IVSHMEM send interrupts from kernel
Message-ID: <CAK7rcp8geWWaqw2NBTHsuMz5vg2Tg7baHqM49OOCc5O4hnSQAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,


I am following your blogs at nairobi-embedded.org, I am interested for
help on how I can send interrupts from one QEMU guest directly through
to another guest. I'll explain my setup and what all I've done. My
setup is pretty consistent and unchanging in that the memory flows
between two QEMU guests will not change so much.

One thing I've tried to do is follow the example set by uio_send.c at:

https://github.com/henning-schild/ivshmem-guest-code/blob/master/uio/tests/Interrupts/VM/uio_send.c

And write to the memory address just as it did, but in the kernel
land. I thought that it would be mmio memory, so that I should use the
kernel writel call, but I'm not sure that I can get the cmd and dest
parameters correct in order to get qemu to send the interrupt as it
should. Just to be clear, I tried to get variations of Line 56 in
uio_send to work in my kernel. I have tried using both uio_send and
using my kernel function, and explored much more cmd/dest combinations
using uio_send. I've also tried one of your programs for qeventfd
sending, to be run on the host and received in the guest.

I start my QEMU guest with the following arguments:

-chardev socket,path=/tmp/ivshmem_socket,id=shm_in -device
ivshmem,shm=shm_in,size=4 -chardev
socket,path=/tmp/ivshmem_socket,id=shm_out -device
ivshmem,shm=shm_out,size=4

What I would like is for the shm_out shared memory to be able to send
interrupts to the QEMU guest that shares it's ivshmem region. I don't
understand the chardev option id, or what that means so I've tried
various things and among the latest is to name it according to the
ivshmem shm region name. I'm not sure if that's right, or if I should
be using numbers.

In any case, I still don't quite understand how the ID thing works
between the ivshmem_server on the host and the guest, both the command
line chardev and the ID the server assigns and how I can fit that into
my workflow. I'm pretty sure that the IDs that the ivshmem_server
process assigns to the QEMU guests is first come first serve and
distinct from the chardev ID, but I am not sure.

Is there something like an example where the actual parameters to the
QEMU process aren't abstracted out?
