From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Aug 2018 17:16:21 +0000
Subject: [Buildroot] [Bug 11166] Erlang bad argument on valid uint64 when
 crosscompiled on 64-bit host
In-Reply-To: <bug-11166-163@https.bugs.busybox.net/>
References: <bug-11166-163@https.bugs.busybox.net/>
Message-ID: <bug-11166-163-1wthVXVwFe@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11166

--- Comment #6 from Frank Vasquez <frankv@helium.com> ---
> Also, is your simple example and Buildroot tree somewhere public?

Here it is.

https://github.com/fvasquez/buildroot

See the following commit for my rebar3-related modifications.

https://github.com/fvasquez/buildroot/commit/6411ce9d06a1880e082674231a1902f364fc4da8

Make sure to checkout the bbb-bitcask branch before building.  This branch is
based off of the Buildroot 2018.02.01 tag since that's what we're running on
our device.

$ git checkout bbb-bitcask
$ make bbb-bitcask_defconfig
$ make

I booted the resulting image on a BeagleBone Black and verified that my bug
still repros.

# erl
Eshell V9.0  (abort with ^G)
1> Handle = bitcask:open("some_db", [read_write]).
#Ref<0.3081199234.2883585.143186>
2> N = 1.
1
3> bitcask:put(Handle, <<"some_key">>, term_to_binary(N)).
** exception error: bad argument
     in function  bitcask_nifs:keydir_get_int/3
        called as
bitcask_nifs:keydir_get_int(#Ref<0.3081199234.3014657.143177>,
                                              <<"some_key">>,
                                              18446744073709551615)
     in call from bitcask_nifs:keydir_get/3
(/home/frank/buildroot/output/build/erlang-bitcask-0.1.0/_build/default/lib/bitcask/src/bitcask_nifs.erl,
line 181)
     in call from bitcask:do_put/5
(/home/frank/buildroot/output/build/erlang-bitcask-0.1.0/_build/default/lib/bitcask/src/bitcask.erl,
line 1760)
     in call from bitcask:put/3
(/home/frank/buildroot/output/build/erlang-bitcask-0.1.0/_build/default/lib/bitcask/src/bitcask.erl,
line 298)

Make sure to delete the some_db directory or rename your bitcask store before
re-running bitcask:open.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
