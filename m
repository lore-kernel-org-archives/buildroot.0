From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 31 Jul 2007 11:45:07 +0200
Subject: [Buildroot] --includedir=/usr/include
	vs	--includedir=(STAGING_DIR)/usr/include
In-Reply-To: <0707311014040.1707@somehost>
References: <0707302043450.17391@somehost>
	<20070730190231.GA5834@real.realitydiluted.com>
	<0707302103451.17391@somehost> <20070730193608.GB27993@aon.at>
	<0707302148220.17391@somehost> <20070730201107.GD29064@aon.at>
	<0707311014040.1707@somehost>
Message-ID: <20070731094507.GA5280@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 31, 2007 at 10:40:55AM +0200, Cristian Ionescu-Idbohrn wrote:
>On Mon, 30 Jul 2007, Bernhard Fischer wrote:
>
>> On Mon, Jul 30, 2007 at 09:52:51PM +0200, Cristian Ionescu-Idbohrn wrote:
>> >On Mon, 30 Jul 2007, Bernhard Fischer wrote:
>> >
>> >> >  --includedir=/usr/include vs --includedir=$(STAGING_DIR)/usr/include
>> >> >                                            ^^^^^^^^^^^^^^
>> >>
>> >> depending on the package --prefix=$(STAGING_DIR)/usr is enough
>> >  ^^^^^^^^^
>> >
>> >Could you please be more verbose? How does one identify which is which?
>>
>> packages that use autoconf usually have:
>>
>> Installation directories:
>>   --prefix=PREFIX         install architecture-independent files in
>> PREFIX
>>                           [/usr/local]
>
>But of course. Using --prefix=/usr (instead of 10 options) should be
>enough in most cases. A lot of configure options need removing from
>the .mk files.

/me nods

[snip overall happy agreement]
>> libpcap, for example can be configured with
>> --prefix=/usr
>> and installed with
>> $(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBPCAP_DIR) install
>> (assuming that it doesn't install anything into /etc).
>>
>> See?
>
>Quite simple, isn't it :D ?

yep :)
>
>> PS: Of course there is DESTDIR vs. PREFIX. Look at the respective
>> Makefile{.am,.in,}
>
>Yes.
>
>I was probably not clear enough. Let me try one more time.
>
>  --prefix=/usr vs --prefix=$(STAGING_DIR)/usr
>                            ^^^^^^^^^^^^^^
>
>I noticed use of the -isysroot and --sysroot gcc compiler options. My
>interpretation of these options after reading the info pages:
>
>,----
>| `-isysroot DIR'
>|      This option is like the `--sysroot' option, but applies only to
>|      header files.  See the `--sysroot' option for more information.
>|
>| `--sysroot=DIR'
>|      Use DIR as the logical root directory for headers and libraries.
>|      For example, if the compiler would normally search for headers in
>|      `/usr/include' and libraries in `/usr/lib', it will instead search
>|      `DIR/usr/include' and `DIR/usr/lib'.
>|
>|      If you use both this option and the `-isysroot' option, then the
>|      `--sysroot' option will apply to libraries, but the `-isysroot'
>|      option will apply to header files.
>|
>|      The GNU linker (beginning with version 2.16) has the necessary
>|      support for this option.  If your linker does not support this
>|      option, the header file aspect of `--sysroot' will still work, but
>|      the library aspect will not.
>`----
>
>is that $(STAGING_DIR) is not needed if the gcc option
>--sysroot=$(STAGING_DIR) is used. Does this make sense?

yes, it does in my POV. IIRC the old, unsupported (by upstream) gcc
versions without sysroot support pass the staging_dir via -I and -L, but
you should double check if a non sysroot-enabled toolchain still builds
them fine, i guess.

cheers,
