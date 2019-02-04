From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 21:20:27 +0100
Subject: [Buildroot] [PATCH] support/testing: add docker /
 docker-compose tests
In-Reply-To: <20190204195345.6494760a@windsurf> (Thomas Petazzoni's message of
 "Mon, 4 Feb 2019 19:53:45 +0100")
References: <20190204165557.2160-1-peter@korsgaard.com>
 <20190204195345.6494760a@windsurf>
Message-ID: <87a7jbs3uc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > On Mon,  4 Feb 2019 17:55:57 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> Build for x86-64 as public containers in general are only available for
 >> x86-64.  Docker needs a number of kernel options enabled, so use a custom
 >> kernel config based on the qemu one.

 > Do you need to duplicate the kernel config entirely, or can you use
 > board/qemu/x86_64/linux.config + a fragment ?

I didn't really look closely. I recently setup docker / docker-compose at
$WORK, so I based the linux config on that.

I can have a look at basing it on the qemu config, but that means that
we have to be a bit careful when bumping the qemu config, so I'm not
sure if it makes sense.


 >> Docker needs entropy at startup, so enable the virtio-rng-pci device to
 >> expose entropy to the guest.  The default RAM amount (128M) is not enough to
 >> run docker / docker-compose, so bump to 512MB.

 > Wow. Go is efficient :)

;)

 >> diff --git a/support/testing/conf/docker-compose.yml b/support/testing/conf/docker-compose.yml
 >> new file mode 100644
 >> index 0000000000..49ff2677da
 >> --- /dev/null
 >> +++ b/support/testing/conf/docker-compose.yml
 >> @@ -0,0 +1,4 @@
 >> +version: '3'
 >> +services:
 >> +  busybox:
 >> +    image: "busybox:latest"

 > Is conf/ really the right place for this ? Don't we have some other
 > place to store the per-tests artifacts that go on the target ? I don't
 > think we have a good organization for this at the moment, so this will
 > do for now.

Indeed. We have a number of more-or-less random files under conf/, and
then E.G. tests/package/test_python_*.py stores files for the target
also under tests/package/sample_*.py

I can move the files under tests/package if you prefer, but I'm not sure
if that is really cleaner.

-- 
Bye, Peter Korsgaard
