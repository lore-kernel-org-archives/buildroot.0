From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 16 Aug 2018 18:51:09 +0000
Subject: [Buildroot] [Bug 11166] Erlang bad argument on valid uint64 when
 crosscompiled on 64-bit host
In-Reply-To: <bug-11166-163@https.bugs.busybox.net/>
References: <bug-11166-163@https.bugs.busybox.net/>
Message-ID: <bug-11166-163-0pXRLb4q3T@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11166

--- Comment #3 from Frank Vasquez <frankv@helium.com> ---
I have a very simple repro for this bug now.  This bitcask example is taken
straight from Joe Armstrong's Programming Erlang book.  Here I am running the
example on a Buildroot image cross-compiled on a 32-bit Linux VM.


# erl -pa ebin
Erlang/OTP 20 [erts-9.0] [source] [smp:2:2] [ds:2:2:10] [async-threads:10]
[kernel-poll:false]

Eshell V9.0  (abort with ^G)
1> Handle = bitcask:open("some_db", [read_write]).
#Ref<0.4215703536.2955149313.140816>
2> N = 1.
1
3> bitcask:put(Handle, <<"some_key">>, term_to_binary(N)).
ok


And here I am running the same example on a Buildroot image cross-compiled on a
64-bit Linux VM.

# erl -pa ebin
Erlang/OTP 20 [erts-9.0] [source] [smp:2:2] [ds:2:2:10] [async-threads:10]
[kernel-poll:false]

Eshell V9.0  (abort with ^G)
1> Handle = bitcask:open("some_db", [read_write]).
#Ref<0.992227993.3221749761.137832>
2> N = 1.
1
3> bitcask:put(Handle, <<"some_key">>, term_to_binary(N)).
** exception error: bad argument
     in function  bitcask_nifs:keydir_get_int/3
        called as
bitcask_nifs:keydir_get_int(#Ref<0.992227993.3221880833.137823>,
                                              <<"some_key">>,
                                              18446744073709551615)
     in call from bitcask_nifs:keydir_get/3
(/home/frank/nextgate/rootfs/output/build/erlccbug-0.1.0/_build/default/lib/bitcask/src/bitcask_nifs.erl,
line 181)
     in call from bitcask:do_put/5
(/home/frank/nextgate/rootfs/output/build/erlccbug-0.1.0/_build/default/lib/bitcask/src/bitcask.erl,
line 1760)
     in call from bitcask:put/3
(/home/frank/nextgate/rootfs/output/build/erlccbug-0.1.0/_build/default/lib/bitcask/src/bitcask.erl,
line 298)

Line 181 of bitcask_nifs.erl is the call to keydir_get_int(Ref, Key, Epoch)
below.

keydir_get(Ref, Key, Epoch) ->
    case keydir_get_int(Ref, Key, Epoch) of
        E when is_record(E, bitcask_entry) ->
            <<Offset:64/unsigned-native>> = E#bitcask_entry.offset,
            E#bitcask_entry{offset = Offset};
        _ ->
            not_found
    end.

The bad argument exception is coming from this NIF code.

ERL_NIF_TERM bitcask_nifs_keydir_get_int(ErlNifEnv* env, int argc, const
ERL_NIF_TERM argv[])
{
    bitcask_keydir_handle* handle;
    ErlNifBinary key;
    uint64 epoch; //intentionally odd type to get around warnings

    if (enif_get_resource(env, argv[0], bitcask_keydir_RESOURCE,
(void**)&handle) &&
        enif_inspect_binary(env, argv[1], &key) &&
        enif_get_uint64(env, argv[2], &epoch))
    {
        ...
    }
    else
    {
        return enif_make_badarg(env);
    }
}

My theory is that the enif_get_uint64(env, argv[2], &epoch) condition is
returning false which should rarely be the case if Erlang is cross-compiled
correctly.  Maybe Uint64 is incorrectly defined as unsigned long or something
to that effect when cross-compiling on a 64-bit VM.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
