From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 27 Apr 2020 00:25:54 +0200
Subject: [Buildroot] [PATCH v2] package/python-pycrypto: fix python3.8
 compatibility
In-Reply-To: <CADvTj4qJ3jC_y_rNwwbDF5jq7xF8BAF39uqnuQKQgi3nxYTaBg@mail.gmail.com>
References: <20200420140724.3206074-1-romain.naour@gmail.com>
 <20200421222847.09432773@windsurf.home>
 <CADvTj4qJ3jC_y_rNwwbDF5jq7xF8BAF39uqnuQKQgi3nxYTaBg@mail.gmail.com>
Message-ID: <73a3a2b2-7279-c46a-e79b-2fe0a68cecfc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James, All,

Le 21/04/2020 ? 22:49, James Hilliard a ?crit?:
> On Tue, Apr 21, 2020 at 2:28 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> On Mon, 20 Apr 2020 16:07:24 +0200
>> Romain Naour <romain.naour@gmail.com> wrote:
>>
>>> Apply the patch from Fedora 31 [1][2] to replace the user-space RNG with a
>>> thin wrapper to os.urandom. This allow to fixes compatibility with
>>> Python 3.8 since the code containing time.clock() is removed.
>>>
>>> time.clock() was deprecated in Python 3.3 and removed in Python 3.8.
>>>
>>> [1] https://src.fedoraproject.org/rpms/python-crypto/c/a5fd7148fb0e9d5526f24feb1bb708bf203480b9?branch=f31
>>> [2] https://src.fedoraproject.org/rpms/python-crypto/blob/f31/f/pycrypto-2.6.1-use-os-random.patch
>>>
>>> Fixes:
>>> https://gitlab.com/buildroot.org/buildroot/-/jobs/498144209
>>>
>>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>>> ---
>>> This patch would allow to use python2 and python3.
>>> To be backported to Buildroot 2020.02 to fixes the qemu-arm-vexpress-tz defconfig.
>>> ---
>>>  ...2-pycrypto-2.6.1-use-os-random.patch.patch | 1904 +++++++++++++++++
>>>  1 file changed, 1904 insertions(+)
>>>  create mode 100644 package/python-pycrypto/0002-pycrypto-2.6.1-use-os-random.patch.patch
>>
>> Meh, the Fedora patch is really gigantic. I think the option suggested
>> by James makes a lot of sense. I think even for 2020.02.x it could be
>> an acceptable solution. As you said, the only user of
>> host-python-pycrypto is crda, so it's not a huge effort to quickly test
>> that it still builds fine on 2020.02.x with python-pycryptodome.
> Actually we probably just need to add python-m2crypto and drop
> https://github.com/buildroot/buildroot/blob/master/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
> as it appears that python-m2crypto added support for python 3.

python-m2crypto was removed from Buildroot by commit [1], it was only used by
crda package. But since crda is a "legacy" package, I don't think it's worth the
effort to re-add this package.

From [2]
  "CRDA is no longer needed as of kernel v4.15 since commit 007f6c5e6eb45
  ("cfg80211: support loading regulatory database as firmware file") added
  support to use the kernel's firmware request API which looks for the
  firmware on /lib/firmware. Because of this CRDA is legacy software for
  older kernels. It will continue to be maintained."

[1]
https://git.buildroot.net/buildroot/commit/?id=484c04878e5e76cdc0cc33c7646f98ab41698a7e
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/tree/README?id=9856751feaf7b102547cea678a5da6c94252d83d#n8


Best regards,
Romain


>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
