From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 9 Feb 2020 17:37:28 +0100
Subject: [Buildroot] [PATCH v3 02/10] package/rust: build and install
 cargo
In-Reply-To: <20200209102131.GK23769@scaer>
References: <20200207180829.165689-1-arnout@mind.be>
 <20200207180829.165689-3-arnout@mind.be> <20200209102131.GK23769@scaer>
Message-ID: <88b71ee6-02ca-f0f3-27bb-5ef04ac1f3a9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/02/2020 11:21, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2020-02-07 19:08 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>>
>> Cargo source code is not provided anymore as a separate tarball but is
>> now built along with the Rust compiler.
>>
>> So update rust host variant to build Cargo and install the
>> cross-compilation configuration file.

 Hm, this last part of the sentence is not valid anymore.

>>
>> All this will be overwritten again by the host-cargo package, but
>> that will be removed in later commits.
>>
>> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
>> Tested-by: Sam Voss <sam.voss@rockwellcollins.com>
>> [Arnout: merge all install commands in HOST_RUST_INSTALL_CMDS]
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> The commit does not look to do what it says in the commit log.
> 
> The commit log says "merge all install commands in HOST_RUST_INSTALL_CMDS"
> but HOST_RUST_INSTALL_CMDS are not touched; only CONFIGURE_CMDS are.

 The previous version split up the _INSTALL_CMDS into separate variables. I
undid that change and merged them together in a single HOST_RUST_INSTALL_CMDS,
so there's no change anymore. Well, originally there still was the installation
of cargo/config but I moved that somewhere else and in a separate commit. So
probably a better description would have been "don't change
HOST_RUST_INSTALL_CMDS; move cargo/config generation to post-toolchain hook and
in a separate commit".

 Regards,
 Arnout

> 
> So, I'm not sure I follow what's going on...
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>  package/rust/rust.mk | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
>> index 5d14fc6682..9bbed15082 100644
>> --- a/package/rust/rust.mk
>> +++ b/package/rust/rust.mk
>> @@ -47,11 +47,14 @@ define HOST_RUST_CONFIGURE_CMDS
>>  		echo 'python = "$(HOST_DIR)/bin/python2"'; \
>>  		echo 'submodules = false'; \
>>  		echo 'vendor = true'; \
>> +		echo 'extended = true'; \
>> +		echo 'tools = ["cargo"]'; \
>>  		echo 'compiler-docs = false'; \
>>  		echo 'docs = false'; \
>>  		echo 'verbose = $(HOST_RUST_VERBOSITY)'; \
>>  		echo '[install]'; \
>>  		echo 'prefix = "$(HOST_DIR)"'; \
>> +		echo 'sysconfdir = "$(HOST_DIR)/etc"'; \
>>  		echo '[rust]'; \
>>  		echo 'channel = "stable"'; \
>>  		echo '[target.$(RUSTC_TARGET_NAME)]'; \
>> -- 
>> 2.24.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
