From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 21 Oct 2018 02:01:37 -0300
Subject: [Buildroot] [RFC] testing: add python-crossbar tests
References: <CALFsTFVpjgYWNr=VoeT3Wj+DjYtFdUNNNw9_Z2COzQMrpxQxWQ@mail.gmail.com>
Message-ID: <5bcc083188f1f_56b83f8d16040a3c5959@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Oct 20, 2018 at 12:49 PM, Asaf Kahlon wrote:

> I just remembered I've submitted a patch for a new host package long
> time ago: http://patchwork.ozlabs.org/patch/896368/
> Yegor mentioned that maybe it can help to reduce python-crossbar
> startup time on the tests.
> Thomas/Yegor, I see the patch was reviewed by Yegor but wasn't
> applied. If there's something missing, please let me know.
> I hope it will help.

I am not against that patch but I am afraid it won't fix the scenario tested in
this patch.

Turns out that the qemu image we use don't have enough entropy at boot time.

I confirmed by running this command on the qemu:
# cat /proc/sys/kernel/random/entropy_avail
0

Because of this, crossbar -> pynacl -> libsodium hangs waiting for /dev/random,
see [1].

We could update the default kernel image used by the test infra (today 3.11.0),
or even use a custom one (4.14.x for instance) compiled in this test case, to
get the getrandom syscall. It would improve a lot the startup time but we would
yet need to use a timeout of a few minutes.

The most elegant solution IMO is to add haveged to the image built for this test
case by the test infra. This is what people with a real target with low entropy
probably would use, I guess. There is no need to update the kernel this way.

I have locally a v2 of this test case that I will send, see [2] for the test
passing on the current master, but before I send it I will wait for feedback in
another patch [3].
This is the changelog for v2:
 - call 'crossbar version' instead of 'python -m "crossbar version"'
   because it is not supported anymore, giving this message:
   /usr/bin/python3: No module named crossbar.__main__; 'crossbar' is a package and cannot be directly executed
 - add haveged to the target to provide enough entropy, avoiding
   hanging forever (on our current kernel 3.11.0 default image) or for
   a long time (when the default kernel image is upgraded to a newer
   kernel);
 - remove test for python 2 because upstream dropped support;
 - do not pass timeout parameter since version_test is now called once;
 - rewrap commit message to 72
 - update code-style (we adopted flake8 after v1 submission)
 - update .gitlab-ci.yml

[1] https://github.com/pyca/pynacl/issues/327
[2] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/110669652
[3] http://patchwork.ozlabs.org/patch/984425/


Regards,
Ricardo
