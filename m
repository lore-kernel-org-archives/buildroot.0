From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Nov 2016 11:40:57 +0100
Subject: [Buildroot] [PATCH v2] package/pseudo: update version
In-Reply-To: <20161127231918.6a07ab13@free-electrons.com>
References: <20161127011202.6938-1-gael.portay@savoirfairelinux.com>
 <20161127231918.6a07ab13@free-electrons.com>
Message-ID: <cd4dd4c7-f08b-2256-37ae-916c405938d2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-11-16 23:19, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 26 Nov 2016 20:12:02 -0500, Ga?l PORTAY wrote:
>> Brings in fix about shutdown synchronization with the server.
>>
>> See commit message:
>>     If you're running pseudo in docker, a script that creates a pseudo
>>     daemon can exit, causing docker to kill pseudo before it's done writing
>>     the database.
>>
>>     Since the client sending the shutdown request doesn't have its socket
>>     closed explicitly by the server, we can just read from the socket in
>>     the client to create a delay until the actual exit, which can take
>>     a while if there's an in-memory DB.
>>
>> Furthermore, the patch add the -S argument that tells the server to
>> shutdown and waits for its completion.
>>
>> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> 
> Now that we no longer use pseudo, and have gotten back to fakeroot
> instead, we don't need to apply this patch to the master branch. But of
> course, it doesn't apply to the next branch, because this branch
> doesn't have all the previous updates to the pseudo package.

 It also doesn't apply to the master branch anymore because the wrapper has been
removed there. I think that's unfortunate, but understandable because Peter just
did reverts rather than cooking up an entirely new patch to switch back from
pseudo to fakeroot.


> Generally speaking, pseudo is now an "orphan" host package, which we
> generally don't like in Buildroot, since it means it is never tested.
> What should we do about it? Remove it until it gets used again in the
> future?
> 
> I've added Arnout, Yann and Peter in Cc so we can have a discussion
> about this.

 I think that to re-add pseudo, it doesn't make sense to revert the reverts,
because that gives us some intermediate states that are known to be broken. So
it makes more sense to me to remove the pseudo package as well now in master,
and re-introduce a completely working pseudo package later.

 Therefore, this patch should become Changes Requested or Rejected.

 Gael, Yann, can you summarize (in a new thread) the reasons to switch to
pseudo? What possibilities does it give either to the user or to the BR
developers, which aren't possible now?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
