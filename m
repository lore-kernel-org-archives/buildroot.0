From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 4 Oct 2012 12:56:10 +0200
Subject: [Buildroot] Question about 64Bit kernel and 32Bit applications
In-Reply-To: <506D5218.2060401@mind.be>
References: <CAMJ=MEd+eR2Z1yUKu541TQzQJOhu-fpa6HDLD0e-0+n-Jt-6WA@mail.gmail.com>
 <20121002160254.3b94fe25@skate>
 <CAMJ=MEe-AfvoQ9tx5z3Wo2=w3tTbsorqCmcSp6trkxMmwpusZg@mail.gmail.com>
 <20121002194921.5fb92a46@skate>
 <CAMJ=MEf59P7U5hFc43kqNwBJg-O1narSbvjvRO5cGfueps+vcw@mail.gmail.com>
 <CAMJ=MEcQ510+eF7qa6WEJrN-4M2uu+9cejXO9cwwsgwMNCiiHQ@mail.gmail.com>
 <506D5218.2060401@mind.be>
Message-ID: <CAAXf6LXDkFmh6KLGdU=kG7ijaKhZB7i+kR2=xggbbChapjidzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 4, 2012 at 11:08 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 02/10/12 22:46, Ronny Meeus wrote:
>>
>> Another solution would be to have 2 buildroot environments, 1 for the
>> 32bit applications and 1 for the 64bit applications.
>> For example the 64bit could be "the master" one. In this a directory
>> of the slave buildroot can be specified and this master will merge the
>> 32bit applications together with its libraries from the slave
>> output/target into its own target/output and remake the rootfs.
>>
>> This might not be a nice solution, but I think it will work.
>>
>> It can be considered similar to BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
>> where a copy is made of certain things into the root-fs.
>
>
>  First of all, I'm not at all convinced that the multilib usecase is valid
> for buildroot.  I mean, obviously it's a valid usecase, but if you need
> that I don't think that buildroot should be your weapon of choice.
>
>  That said, if you (temporarily) do need a mixed 32/64-bit system, I think
> this approach is the most appropriate: make two separate buildroot builds,
> and merge them together at the end.  The merge can be done in the post-build
> script.  The post-build script could even call the'make' for the other part
>  of the system...  The tricky part is that the libraries from the 'slave'
> environment will have to be moved into a multilib directory (i.e. lib32 or
> lib64).
>
>  I don't immediately see a need for changes in the buildroot infrastructure.
>

The downside with this approach is that there will be a lot of
duplicate builds. You only need 32-bit versions of the libraries. All
the rest of userspace would be 64-bit only. To achieve that, you'd
have two separate defconfigs, one with only libraries, 32-bit, and one
with everything, 64-bit.
However, still with that configuration a lot is duplicated: all the
host builds like host-automake, host-autoconf, ... would be created in
each buildroot instance.

I like following approaches better:
- 64-bit kernel, entire 32-bit userspace
- 64-bit kernel, mostly 64-bit userspace, but selected libraries built
only in 32-bit (e.g. using a local.mk-like file to specify)
- 64-bit kernel, 64-bit applications, 64+32bit libraries (true multilib).

In all of these cases, you will probably need to look into the
toolchain extraction, as you'll need the correct sysroot lib
directories (possibly multiple).

Best regards,
Thomas
