From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 22 Mar 2018 00:17:26 -0300
Subject: [Buildroot] [PATCH next v2 4/5] support/scripts/pkg-stats-new:
 add latest upstream version information
References: <20180321223559.43b49d2f@windsurf>
Message-ID: <5ab32046eb66f_65553f823731ae7c5251a@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Mar 21, 2018 at 06:35 PM, Thomas Petazzoni wrote:

> On Wed, 28 Feb 2018 00:03:53 -0300, Ricardo Martincoski wrote:
> 
>>  [0000] vdr-plugin-vnsiserver => (False, None, None)
>> [hangs here, I waited 10 minutes]
> 
> I should have fixed this, will be in v3. I'm now handling exceptions in
> all cases, and I've added a timeout on the urllib2.urlopen() calls, that
> will make it abort after 15 seconds if the HTTP request has not
> returned.
> 
> This will allow to make sure the script terminates properly. However,
> it means that the result of the script may be different from one run to
> the other, as the HTTP request for a given package may sometimes take
> more than 15 seconds, sometimes not.

Do you mean the generated html will be different?
Will the script retry for a package that timeouts?
Well... I can wait you send v3 to know this.

> 
> I guess this is a good enough trade-off, until upstream provides us a
> better way of retrieving the data.

The upstream is working to provide api_v2 that will improve various aspects.
The main changes in the api are a new field ecosystem (it will contain pypi for
python packages, upstream url for custom projects, ...) and the paging system in
the web interface.
The new api will also provide the mapping:
url/api/v2/projects?distribution=Buildroot
I tested this by running a local server with a copy of the production database.
Sample output:
...
{
    "distribution": "Buildroot", 
    "ecosystem": "https://download.samba.org/pub/samba/", 
    "name": "samba4", 
    "project": "samba"
}, 
...

Most changes in the code look (to me) ready and the upstream is currently
setting up a staging server.
Api v2 is *not yet* deployed to release-monitoring. I don't know the upstream
timeline for this.

In the meanwhile, the solution you propose seems to be the best we can do using
api v1.

Right now there is a single direct user of the script (the server that
generates the html), so a time penalty is not critical.
All the other users (we) will access the already generated pkg-stats html.


But I think it is better to upgrade to api v2 before we provide this script as a
build target to generate a report based on the packages selected by .config .
I think you mentioned something similar in an e-mail I unfortunately can't find
right now.

Regards,
Ricardo
