From: Bernhard Fischer <rep.nop@aon.at>
Date: Mon, 11 Dec 2006 23:27:08 +0100
Subject: [Buildroot] [patch] qtopia4
In-Reply-To: <20061211215648.GA15000@zelow.no>
References: <20061211093336.GA11591@zelow.no> <20061211102408.GB20661@aon.at>
	<20061211120041.GB11591@zelow.no> <20061211134347.GA21997@aon.at>
	<20061211215648.GA15000@zelow.no>
Message-ID: <20061211222708.GE4442@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 11, 2006 at 10:56:48PM +0100, Thomas Lundquist wrote:
>On Mon, Dec 11, 2006 at 02:43:47PM +0100, Bernhard Fischer wrote:

>> >+	$(SED) 's/-O2/-Os/;' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
>> 
>> shouldn't this rather be
>> s/-O2/-Os $(TARGET_CFLAGS)/
>
>then it could be 
>s/-O2/$(TARGET_CFLAGS)/
>
>since -Os should be included.

Yes.
>
>Something tells me that I shouldn't do that here. Don't ask me why, I
>spent quite alot of time getting qtopia to compile at all.

Trouble is that some arches may need some fancy flags to generate proper
code, users may want to globally set some additional flags that should
be used for all packages that are built. Please verify if passing the
correct TARGET_CFLAGS down to qtopia works as expected thus area lso
used in qtopia.
>
>> Also, all trailing command separators (i.e. ';') in sed are superfluous.
>
>It's a habit. Any real reason we should make it a requirement not to
>have it or is it just for looks?

Well, it's bloat :) Habit of mine to omit them if they are not needed.
>
>> >+	cp $(QTOPIA4_QCONFIG_FILE) \
>> >+	 	$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
>> >+	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
>> >+		PATH=$(TARGET_PATH) \
>> >+		CFLAGS="$(TARGET_CFLAGS)" \
>> >+		CXXFLAGS="$(TARGET_CXXFLAGS)" \
>> 
>> Sounds like this is will break for anybody that doesn't have a plain
>> "gcc" nor "g++" binary. Honor the user's HOSTCC and HOSTCXX vars,
>> please.

Of course ment CC and CXX and not the host compilers, sorry.
>
>If Troll/qtopia would, I would.
>(No, they don't seem to honour CC nor CXX)

Can't be.. Otherwise you'd build qtopia for the host and not for the
target. Please double check (could be that configure stores them for
you).


>I'll send you a new patch with or without ;.
>(and if you really don't want them I guess I have to remove them from
>other packages I've planned to submit.)

Please do. It just wastes space and memory.
Thanks,
