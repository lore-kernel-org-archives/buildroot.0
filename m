From: Steve Calfee <stevecalfee@gmail.com>
Date: Fri, 22 Apr 2016 09:43:31 -0700
Subject: [Buildroot] rootfs overlay best practices
In-Reply-To: <CAF_dkJAfQO7gxXCb-svzqt+e0UMOSemvbuG9L19XwPdw5pu2WQ@mail.gmail.com>
References: <CAF_dkJDPv-Z6AW8u-AsTukovBhMNLR0q-1326qOxi7RfFtBL7A@mail.gmail.com>
 <57194FA7.3020803@mind.be>
 <CAF_dkJAfQO7gxXCb-svzqt+e0UMOSemvbuG9L19XwPdw5pu2WQ@mail.gmail.com>
Message-ID: <CAJJ6jxsd5Bp9KQYMVPkR3knQRMFKzwr5M7TD4_qihPa3uabPSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Patrick,

I like these user questions on the mail list. See below

On Fri, Apr 22, 2016 at 6:35 AM, Patrick Doyle <wpdster@gmail.com> wrote:
> Yes -- that was the intent of my email -- how do folks handle this
> situation in the real word?  Which approach do you use?  Which works
> the best for you? (And by "you", I mean "buildroot community", not
> specifically "Arnout")
>
Personally, I like to keep things simple. Makes it easier to maintain,
update in the field etc. It does require a little more time when
setting up a new embedded service like say MySQL or something.

I like to run most of the system directly from a read only filesystem.
Stuff that needs persistent data should be on another read/write
filesystem. Overlay or unionfs hide what is changeable and what has
been changed. It easy to have hacks done on a dev system not get
propaged to a production system causing failures.

So I have most of the rootfs in one flash partition and have another
partition just for writeable data. So mysql will run out of rootfs
flash and access its db and writeable files from the other partition.
Lots of fuss setting up the initial layout- editing configs etc, but
nice when running.

Also, you can re-virginize a system by clearing the writable
partitiion. If done correctly a reboot will then reestablish the
needed files in the rw partition.

Regards, Steve
