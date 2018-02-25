From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 25 Feb 2018 21:38:45 +0100
Subject: [Buildroot] [PATCH-FOR-NEXT v1 3/6] pkgconf: add
 host-pkg-config wrapper
In-Reply-To: <ac315087-1cdd-a2c6-3a5c-2142137cdb79@mind.be>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-4-gael.portay@savoirfairelinux.com>
 <20180221225010.4b4228aa@windsurf.lan>
 <0e296fe2-3359-581f-6d3d-d3bc3cac06eb@mind.be>
 <20180222104146.5d4efe6e@windsurf.lan>
 <ac315087-1cdd-a2c6-3a5c-2142137cdb79@mind.be>
Message-ID: <CAAXf6LXh2EjCqMXrsUA1qSSk_NNFLD2HFe2_QtWXqW1LDA4Dbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2018-02-22 11:56 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>
>
> On 22-02-18 10:41, Thomas Petazzoni wrote:
>>>  With the PATH-based alternative, it might make sense to have the cross-stuff
>>> both in $(HOST_DIR)/bin with the tuple prefix, and in $(HOST_DIR)/tuple/bin
>>> without the prefix. That way, we get the advantages of both: comply with
>>> autoconf expectations, and avoid breaking packages or downstream users.
>>
>> I'm still not convinced about changing the HOST_DIR/ organization. It's
>> a massive change, affecting everything, and not just pkg-config, and
>> the outcome is less nice than what we have today, for my perspective.
>
>  Well, this extended PATH-based alternative (which is BTW what I think ThomasDS
> suggested to begin with) is not at all invasive: cross-things stay in host/bin
> as they are today, we just add host/tuple/bin which contains cross-things
> without the tuple-prefix, and we add this to the PATH. Then in a second step, we
> move pkg-config to tuple-pkg-config, BUT we also add it without prefix to
> host/tuple/bin. So it doesn't break anything at all, since for target builds, we
> have host/tuple/bin in PATH (and PKG_CONFIG=host/bin/tuple-pkg-config in the
> environment) - behaviour is the same as before.
>
>  There is a bit of breakage, however: host/tuple/bin/gcc will be in PATH, so any
> package that calls gcc from PATH will now get target gcc instead of host gcc. On
> the other hand, apparently[1], CMake doesn't have any support for building host
> executables and requires a two-step approach instead; I guess most non-autotools
> packages will have a similar limitation.
>
>  So yeah, adding host/tuple/bin to PATH may not be as uninvasive as I thought...
>

For reference, here is my mail:
http://lists.busybox.net/pipermail/buildroot/2018-February/213629.html

I think you misunderstood my question/proposal: what I'd need is a
unique path to the cross tools (gcc, ...) that does _not_ contain the
tuple anywhere in it (or is reachable via a symlink that does not
contain the tuple).
Where I wrote 'cross' in the example path:
    $(HOST_DIR)/bin/cross/{gcc,gdb,nm,readelf}
I really meant the literal string 'cross', not the tuple (the exact
string is of course something that can be discussed)

The reason I need something like that is for scripts/build systems
external to Buildroot. They do not know the tuple upfront, and would
have to do tricks to determine it. All they typically know is a
reference to the buildroot path and a defconfig name.

So, for that use case, I do not need any changes to the PATH env
variable. Just an extra shadow tree with symlinks to the necessary
cross tools, but reachable without knowing the tuple.

/Thomas
