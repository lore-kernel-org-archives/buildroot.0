From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 6 Jan 2012 09:29:22 +0100
Subject: [Buildroot] customize package: odd copy construction
In-Reply-To: <20120105163648.3bf64bcd@skate>
References: <CAAXf6LW1GnqA3fgU9zGXXMdevw+FxCBN2x4PUpCzxM-cHYJeUA@mail.gmail.com>
 <20120105163648.3bf64bcd@skate>
Message-ID: <CAAXf6LVx+0y35z2X3Aj-63e+u2Ks8GusUmGhETTFTdX6Aww+kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 5, 2012 at 4:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Thu, 5 Jan 2012 16:23:23 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> The customize uses an odd copy construction that I can't really explain:
>>
>> ? ? ? ? rm -f $(BUILD_DIR)/series
>> ? ? ? ? (cd $(CUST_DIR); \
>> ? ? ? ? ?/bin/ls -d * > $(BUILD_DIR)/series || \
>> ? ? ? ? ?touch $(BUILD_DIR)/series )
>> ? ? ? ? for f in `cat $(BUILD_DIR)/series`; do \
>> ? ? ? ? ? ? ? ? cp -af $(CUST_DIR)/$$f $(TARGET_DIR); \
>> ? ? ? ? done
>> ? ? ? ? rm -f $(BUILD_DIR)/series
>>
>> This was changed from:
>> ? ? ? ? -cp -af $(CUST_DIR)/* $(TARGET_DIR)/
>>
>> in the following commit:
>> http://git.buildroot.org/buildroot/commit/?id=06cc62f9cfbe43e9d31a07667a6af905b5f34a42
>>
>> Why would you create a series file first if you're removing it
>> immediately afterwards?
>> Doesn't the original copy statement do exactly the same?

First of all, I'm glad I'm not the only one that is puzzled about the
usefulness of the series trick :-)

>
> I don't know, but I'm not sure this customize package is good example
> these days. It should probably be removed, or changed to something
> saner that uses the package infrastructure.

The customize package (or at least the feature that it implements) can
be useful to copy applications built externally to the buildroot
environment. In many cases you could copy directly to the
output/target directory, but when you're packaging your buildroot
environment to send to someone else this is not the best thing. Not
only because sending the whole output/target is unnecessarily big (as
most of it can be recreated from buildroot), but also because a 'make
clean' would remove these applications.

So in my opinion, this use case should be kept in mind, unless there
is a good alternative...

~Thomas
