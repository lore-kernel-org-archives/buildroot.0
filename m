From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 21 Sep 2007 11:31:01 +0200
Subject: [Buildroot] this commit breaks x86_64 toolchain builds
In-Reply-To: <e83232070709120554h3d995dfdwbc055e701b271f80@mail.gmail.com>
References: <e83232070709060559u27a12f78u1ddb96d7c4d7bc20@mail.gmail.com>
	<20070907131447.GD17733@aon.at>
	<e83232070709101445l7db6927dx8a166ef8e9db8572@mail.gmail.com>
	<20070911183533.GD20058@aon.at>
	<e83232070709120554h3d995dfdwbc055e701b271f80@mail.gmail.com>
Message-ID: <20070921093101.GD24467@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 12, 2007 at 10:54:35PM +1000, Roderick Taylor wrote:
>On 12/09/2007, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
>> On Tue, Sep 11, 2007 at 07:45:09AM +1000, Roderick Taylor wrote:
>> >On 07/09/2007, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
>> >> On Thu, Sep 06, 2007 at 10:59:56PM +1000, Roderick Taylor wrote:
>> >> >x86_64, by default uses the lib64 directory to hold 64-bit libraries.
>> >> >not the lib directory as assumed by this commit.
>> >>
>> >> I don't see how the patch mentioned below is the culprit?
>> >
>> >the "-" infront of the cp means ignore errors.  When you build for
>> >x86_64, buildroot puts libgcc_s* etc. in $(REAL_GNU_TARGET_NAME)/lib64
>> >not in lib.  so this line will produce an error, and because the patch
>> >stops make from ignoring this, the build stops.
>> >
>> >-      -cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s*
>> >$(TARGET_DIR)/lib/
>> >+      cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s*
>> >
>> >
>> >> Isn't there a target_gcc_lib_dir we should rather use?
>> >>
>> >
>> >I don't know.   I know we can either modify the gcc build to install
>> >into lib instead of lib64 but I haven't tried it.
>>
>> If the cp errors are ignored, you'd have no libgcc on the target, is
>> that assumption correct? If so, the we have to handle lib64 in a better
>> way. Please verify and let me know..
>>
>> TIA,
>>
>
>Yes, libgcc is missing from the target, but I'm not having any
>problems running programs (Although, the only programs I've tested
>busybox and lspci)
>
>I think a better way is to configure gcc to use
>$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib and not lib64

Unfortunately this is not accurate, you'd break multilib support by
this.

We will have to retain the lib/ vs. lib64/ layout for multilib anyway.
The proper thing to do is to copy the correct libgcc_s to the
corresponding dir (in both the staging dir and the target dir, if asked
to). Look at BR2_MULTILIB. If it is set, copy the libgcc_s that are
currently built. If it is not set, look at the target arch and copy the
corresponding (one) libgcc_s to the appropriate dir.

Care to do that?
