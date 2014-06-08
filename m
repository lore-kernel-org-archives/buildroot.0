From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 8 Jun 2014 17:04:17 +0200
Subject: [Buildroot] [PATCH 5 of 7 v3] toolchain-external: change
 version from 'undefined' to 'virtual'
In-Reply-To: <20140607105728.469dd87d@free-electrons.com>
References: <patchbomb.1402085576@localhost>
 <640c5d9c5ac14d442207.1402085581@localhost>
 <20140607105728.469dd87d@free-electrons.com>
Message-ID: <CAAXf6LX4nfHkyBe_G3eQSBTHr67SWb37TFEOL=0q+vZ1DMmdtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Jun 7, 2014 at 10:57 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Fri, 06 Jun 2014 22:13:01 +0200, Thomas De Schampheleire wrote:
>> The toolchain-external package displays the version 'undefined' in the build
>> messages and the directory in output/build, which is not very nice.
>> This patch sets the version to 'virtual', in analogy to the toolchain and
>> toolchain-buildroot packages (which use the virtual-package infrastructure).
>>
>> Although toolchain-external is not strictly a virtual package, since it uses
>> the generic-package infrastructure, it can be considered as a virtual
>> package in the sense that it does not have a fixed version or source (they
>> depend on the selected external toolchain).
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> I'm sorry, but I continue to disagree. toolchain-external is definitely
> *not* a virtual package. I've started using the
> TOOLCHAIN_EXTERNAL_VERSION field for musl external toolchains, and I
> will send a patch that use it for other toolchains as well.

Ok, I understand your objections. Note that my main point is that it
shouldn't be 'undefined', not that it necessarily has to be 'virtual'.

However, in your pending musl patch, you set
TOOLCHAIN_EXTERNAL_VERSION to 1.0.0 (for example), causing the 'build'
directory to be output/build/toolchain-external-1.0.0 and the messages
to be:
toolchain-external 1.0.0 Downloading

The value 1.0.0 doesn't mean a lot here, you have no clue that this is
a musl, glibc, ... toolchain or which is the provider. Considering
only the messages for a moment, it would make more sense that they
would read:

toolchain-external Sourcery ARM 2012.03 Downloading

(for example), i.e. actually specify which is the external toolchain
we're using.

This could be achieved in multiple ways:
- by setting the TOOLCHAIN_EXTERNAL_VERSION field to this value
(imposing the requirement of it not containing spaces as this value is
also used for the directory name).
- adding an extra field in the MESSAGE definition that can be set in
the toolchain-external package, with 'extra' info. The VERSION field
can then still be 1.0.0 or 2012.03, and the extra info would be
'Sourcery ARM' for example.

The second approach handles both my concern of not having 'undefined'
and is in line with your usage of 1.0.0 for VERSION.

What do you think?

Best regards,
Thomas
