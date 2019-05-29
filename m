From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 May 2019 10:49:18 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/wireshark: fix static build with snappy
In-Reply-To: <20190529085335.35bcbc35@windsurf.home>
References: <20190528203230.24558-1-fontaine.fabrice@gmail.com>
 <20190528224235.7b5a2647@windsurf.home>
 <CAPi7W81VmJbfES03hTnJte8L+9sA_cRExo7jJ9iCs68iq63ZHg@mail.gmail.com>
 <19f31deb-ea26-23aa-e2f7-eca629875ab2@mind.be>
 <20190529085335.35bcbc35@windsurf.home>
Message-ID: <d68f36a0-c707-c2a2-f040-44eda4b7fbc3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/05/2019 08:53, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 28 May 2019 23:04:28 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>>> Is this really the right thing to do? Ideally a program written in C
>>>> should not have to know that a library it is using is written in C++.  
>>
>>  Hm, good point... Snappy provides a C wrapper, so there should indeed not be a
>> need for the client to use the C++ linker. Of course, there also shouldn't be a
>> need for the client to link with libstdc++ :-).
> 
> There is no need to link with libstdc++ when dynamic linking is used,
> which to me is another indication that using the C++ linker is not the
> right approach. Adding -lstdc++ is only necessary in static linking
> configuration, for the usual reason that libA -> libB -> libC in static
> linking scenarios requires passing -lC when linking libA.
> 
>>>> and there's a few other examples in the tree. To be honest, I don't
>>>> know what is the most correct solution, I'm just trying to make
>>>> sure we solve a given problem in the same way everywhere.  
>>
>>  In most other cases we don't do any patching but we pass it through
>> LIBS or similar. I don't think that that's possible with CMake.
>>
>>  For ICU, we patch the .pc file, which is the proper thing to do, but
>> Snappy doesn't have a .pc file.
> 
> Yes, but to me that's another indication that the right thing to do is
> to pass -lstdc++: if the packages were better, they would be using .pc
> files, and we would be able to specify -lstdc++ in their Libs.private.
> Once again, it shows that using the C++ linker is (to me) not the right
> approach.

 +1.


>>> I don't know either. You can apply the first or the second version
>>> of this patch.  
>>
>>  I reset its state to New. Now Thomas can decide :-)
> 
> For the reasons stated above, I think I prefer v1.

 +1


>>  Maybe just send both versions upstream, since you have them both
>> now. Then they can choose which one they like better.
> 
> The most correct solution for upstream would be for snappy to provide
> a .pc file, and for wireshark to use it.

 Not really. Both Snappy and wireshark are CMake packages, so even if Snappy
would install a .pc file, wireshark wouldn't use it because the CMake infra is
preferred.

 The real solution is that CMake has an equivalent of Libs.private, and that
Snappy populates it. But my CMake-fu is not up to this task I'm afraid. Well, I
suppose I *could* find out, but I don't have the time for it :-)

 Any CMake experts on the list?

 Regards,
 Arnout
