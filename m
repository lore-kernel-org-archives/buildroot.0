From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 25 Feb 2018 22:56:47 +0100
Subject: [Buildroot] [PATCH-FOR-NEXT v1 3/6] pkgconf: add
 host-pkg-config wrapper
In-Reply-To: <20180225205326.GF2276@scaer>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-4-gael.portay@savoirfairelinux.com>
 <20180221225010.4b4228aa@windsurf.lan>
 <0e296fe2-3359-581f-6d3d-d3bc3cac06eb@mind.be>
 <20180222104146.5d4efe6e@windsurf.lan>
 <ac315087-1cdd-a2c6-3a5c-2142137cdb79@mind.be>
 <CAAXf6LXh2EjCqMXrsUA1qSSk_NNFLD2HFe2_QtWXqW1LDA4Dbw@mail.gmail.com>
 <20180225205326.GF2276@scaer>
Message-ID: <CAAXf6LUeYyo0jJApJ8rf04ZM6Lez3Ct4af3DaTnEFEfoowNvPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-02-25 21:53 GMT+01:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> Thomas, All,
>
> On 2018-02-25 21:38 +0100, Thomas De Schampheleire spake thusly:
> [--SNIP--]
>> For reference, here is my mail:
>> http://lists.busybox.net/pipermail/buildroot/2018-February/213629.html
>>
>> I think you misunderstood my question/proposal: what I'd need is a
>> unique path to the cross tools (gcc, ...) that does _not_ contain the
>> tuple anywhere in it (or is reachable via a symlink that does not
>> contain the tuple).
>> Where I wrote 'cross' in the example path:
>>     $(HOST_DIR)/bin/cross/{gcc,gdb,nm,readelf}
>> I really meant the literal string 'cross', not the tuple (the exact
>> string is of course something that can be discussed)
>>
>> The reason I need something like that is for scripts/build systems
>> external to Buildroot. They do not know the tuple upfront, and would
>> have to do tricks to determine it. All they typically know is a
>> reference to the buildroot path and a defconfig name.
>
> But then they can call buildroot to know the tuple:
>     eval $(make -s printvars VARS=GNU_TARGET_NAME)
>
> and then gain access to the tuple with ${GNU_TARGET_NAME}.

Except that this is not always correct :-)
For example, on a MIPS octeon based defconfig with external toolchain,
I see:
GNU_TARGET_NAME=mips64-buildroot-linux-gnu
but:
BR2_TOOLCHAIN_EXTERNAL_PREFIX=mips64-octeon-linux-gnu
i.e. GNU_TARGET_NAME does not give the answer for all cases.

Depending on whether you have internal or external toolchain, and in
the latter case on whether the tool you need to access is provided by
the external toolchain or built by Buildroot (like gdb), you need more
logic.
See also the logic and comment here:
http://lists.busybox.net/pipermail/buildroot/2016-April/160055.html


>> So, for that use case, I do not need any changes to the PATH env
>> variable. Just an extra shadow tree with symlinks to the necessary
>> cross tools, but reachable without knowing the tuple.
>
> I wonder if we would want to support this case, especially since we
> can't have a sane way to keep it working.

While I'm open to alternative solutions, I don't see the difficulty here.
All existing logic remains, we'd just add a few extra symlinks from
the shadow path pointing to outpt/host/bin/...

>
> What worries me is that by doing what you suggest, we would be diverging
> *greatly* from established conventions, and any patch to packagees to
> support that, would not be upstreamable...

But none of the packages' source code would need any change for this.
Everything remains exactly as it was.
Only some additional symlinks are provided, which should normally not
be needed by anything inside of Buildroot.

/Thomas
